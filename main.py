import math
import json
import os
from datetime import datetime

from flask import Flask, render_template, request, session, redirect
from flask_mail import Mail
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-password']
)
mail = Mail(app)
# SQLALCHEMY_DATABASE_URI. The database URI that should be used for the connection.
# Examples: sqlite:////tmp/test.db. mysql://username:password@server/db.
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    tagline = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(50), nullable=False)
    content = db.Column(db.String(620), nullable=False)
    bywho = db.Column(db.String(50), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    imgfile = db.Column(db.String(12), nullable=True)


# pagination logic
# first
# prev = #
# next = page+1
# last
# prev = page-1
# next = #
# middle
# prev = page - 1
# next = page + 1
@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    # [0: params['no_of_posts']]
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    # posts = posts[]
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    if page == 1:
        prev = "#"
        next = "/?page=" + str(page+1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if "user" in session and session['user'] == params['admin_user']:
        if request.method == "POST":
            box_title = request.form.get('title')
            by_who = request.form.get('name')
            tline = request.form.get('tagline')
            slug = request.form.get('slg')
            content = request.form.get('content')
            img_file = request.form.get('img')
            date = datetime.now()
            if sno == '0':
                post = Posts(title=box_title, bywho=by_who, slug=slug, content=content, tagline=tline, imgfile=img_file,
                             date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.bywho = by_who
                post.slug = slug
                post.content = content
                post.tagline = tline
                post.imgfile = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post)


@app.route("/about")
def about():
    return render_template('about.html', params=params)


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if "user" in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")


@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if "user" in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded successfully!"


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/dashboard", methods=['GET', 'POST'])
def login():
    # if he's already loggoed in
    if "user" in session and session['user'] == params['admin_user']:
        posts = Posts.query.all()
        return render_template("dashboard.html", params=params, posts=posts)
    # if he has to login
    if request.method == 'POST':
        username = request.form.get("uname")
        userpass = request.form.get("upass")
        if username == params['admin_user'] and userpass == params['admin_password']:
            # set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)
    # if is not a admin
    return render_template('login.html', params=params)


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contacts(name=name, phone_num=phone, date=datetime.now(), msg=message, email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message(
            'New message from ' + name,
            sender=email,
            recipients=[params['gmail-user']],
            body=message + '\n' + phone,
        )
    return render_template('contact.html', params=params)


app.run(debug=True)
