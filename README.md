# ok

**ok** improves your sanity and productivity by helping you create instant bash shortcuts.



## Usage

Do you have a project that you keep coming back to?

```sh
ok set panam ~/Sites/me.local/new-panam-website
```

Move there anytime from anywhere.

```sh
ok cd panam
```

Or open the directory in **Finder**.

```sh
ok open panam
```

Or open the directory in **Sublime Text**.

```sh
ok subl panam
```

---

Add a local URL for a project.

```sh
ok set panam local http://panam.dev/
```

Open it anytime from anywhere.

```
ok open panam local
```

Or see how it looks specifically in **Chrome**.

```sh
ok ch panam local
```

Or see how it looks specifically in **Firefox**.

```sh
ok ff panam local
```

Or see how it looks specifically in **Safari**.

```sh
ok saf panam local
```

---

Open a mockup in **Photoshop**.

```sh
ok shop ~/client-assets/panam/mockup-r3.psd
```

Or map a mockup to a project.

```sh
ok set panam shop ~/client-assets/panam/mockup-r3.psd
```

Open it anytime from anwhere.

```sh
ok shop panam
```



## Installation

First, clone ok into ~/.ok.

```sh
git clone https://github.com/jonathantneal/ok.git ~/.ok
```

Try it out.

```sh
source ~/.ok/ok.sh
```

Satisfied? Add it to your bash profile.

```sh
echo 'source ~/.ok/ok.sh' >> ~/.bash_profile
```

That’s it.

---

## Write a manual

You can write your own manuals for any project. It’s an easy and quick way to remember things.

```sh
ok man panam origin/develop is http://dev.panam.example.com/
ok man panam origin/preview is http://dev.staging.example.com/
```

Read them back later.

```sh
ok man panam
```

```
origin/develop is http://dev.panam.example.com/
origin/preview is http://dev.staging.example.com/
```



## Commands

**ok** comes with a few commands and shortcuts to common developer apps.

**Applications**

- **ch**: Chrome
- **ff**: Firefox
- **gh**: GitHub
- **preview**: Preview
- **saf**: Safari
- **shop**: Photoshop
- **subl**: Sublime

**Commands**

- **cd**: Move into a project directory
- **config**: Edit or create a command in **ok**
- **open**: Open a project, asset, or site
- **man**: Read or write a manual for a project
- **set**: Set a property on a project

---

I hope this makes life sweeter for you.
