# ok

**ok** is a script for making super fast bash shortcuts.

## Let’s install it

First, clone ok into ~/.ok.

```sh
git clone https://github.com/jonathantneal/ok.git ~/.ok
```

Now, try it out.

```sh
source ~/.ok/ok.sh
```

Satisfied? Add it to your bash profile.

```sh
echo 'source ~/.ok/ok.sh' >> ~/.bash_profile
```

That’s it.

---

## Let’s have fun

Have Photoshop? There’s a shortcut for it.

```sh
ok psd
```

Nifty. And you can also use it to open a file.

```sh
ok psd ~/super-duper-website/mockup.psd
```

But, let’s make it faster by mapping this mockup to a project.

```sh
ok set myweb psd ~/super-duper-website/mockup.psd
```

Now we can open the mockup anytime, anywhere!

```sh
ok psd myweb
```

That was fun.

---

## Let’s add our website

Add the local URL for your project

```sh
ok set myweb local http://my-super-duper-website.dev/
```

Now you can open it anytime, anywhere!

```sh
ok open myweb local
```

Have Firefox? Let’s see how it looks there.

```sh
ok ff myweb local
```

Nice, how about Safari?

```sh
ok saf myweb local
```

---

## Let’s add a project

First, let’s create a map to the directory of our project.

```sh
ok set myweb dir ~/projects/my-super-duper-site
```

Now we can move there anytime, anywhere!

```sh
ok cd myweb
```

Use Sublime Text? We can open the directory in there, too.

```sh
ok subl myweb
```

This will be handy!

---

## Let’s write a manual

You can write your own manuals for projects. It’s a good, quick way to remember things.

```sh
ok man myweb "origin/develop is http://d.example.com/"
ok man myweb "origin/preview is http://staging.example.com/"
```

And you can read them back later

```sh
ok man myweb
```

Which will produce:

```
origin/develop is http://d.example.com/
origin/preview is http://staging.example.com/
```

I hope this makes life sweeter for you.

---

## Let’s get nitty gritty

**ok** comes with a few commands and shortcuts to common developer apps.

**Applications**

- **ch**: Google Chrome
- **ff**: Mozilla Firefox
- **hub**: GitHub
- **psd**: Adobe Photoshop

**Commands**

- **cd**: Move into a project directory
- **open**: Open a project or project site
- **man**: Write a manual for a project

**ok Tools**

- **set**: Sets a property on a project
- **config**: Edit or create a command in **ok**
