Getting Started
Introduction

Hi, welcome to Learn How to Program with C++.

My name is Kate Gregory, and I've been using C++ for over 20 years.

When I started, Microsoft didn't even have a C++ compiler.

It wasn't the first language I learned.

That was Fortran, but it can be the first language that you learn.

This course is for you if you want to be a software developer.

And you're willing to learn C++, as your first language.

Perhaps you want to write games, or mobile applications, or cross platform applications.

It doesn't matter what hardware and libraries you're planning to work with.

This course will teach you the syntax and the idioms of the language, and the good news is that the C++ of today is actually simpler than the C++ I learned over 20 years ago, simple enough that you really can use it as the language you learn while you're learning to program.
Course Overview

C++ is a very large language, but you don't need to know all of it to get started.

It's kind of a challenge to teach it completely, because in order to fully understand any given C++ feature you kind of, need to at least partly understand all the other features.

But don't worry about that right now because you don't need to fully understand a feature to use it.

You know, you can drive a car even if you don't know how to change a tire.

And you can use a C++ feature correctly even if there are some subtle aspects of it that haven't been covered yet.

In fact when you're first learning to drive to can learn to drive that car without knowing how to fill it up with gas.

It won't last you long if I send you out in the world and say, okay, you can drive now.

You're going to have to know eventually how to put gas in it but you can start.

So in some of these early modules I'm going to give you enough information to get going and use a particular feature And just to be fair, know that in a later module we might come back to something that was already covered and add another layer of detail.

So let me show you the outline of the course.

This module is getting started, whether I get the tools, what's the very first simplest thing I can do? How do I work the tools, that kind of thing And then we're going to launch into some specific aspects of C++ syntax.

How to show some output to the user, how to get some input from the user, and how to do something with what the user tells us.

Then we're going to get into something that's highly specific to C++, functions, and header files.

That's how you can build up functionality out of smaller pieces into a large and often quite complicated program.

We'll talk about working with strings like names and other pieces of words and text that you might want to work with and some of the built-in functionality that the library that comes with C++ provides to you for typical tasks that you need to do in an application.

I'm going to wait until about half way through the course before I take a little detour to some things that are specific to a particular tool set you might be using.

I'm writing a whole course in a very tool-agnostic way, you don't have to use the same tools as me.

You don't have to use the same operating system as me, and the details of that will come later in this module.

But there are some kind of exceptions in special cases and oh, if you're using this compiler and by the time we get about half way through this.

There's enough of that accumulated that I need to kind of take a pause and say, all right now look.

If you're using this compiler, it's like this, if you're using this compiler, it's like that, and get your feet back under you.

And then we can move forward into some slightly more advanced topics like Writing your own classes.

C++ is an object-oriented language and an object is an instance of a class or, if you like, the class is the definition of how an object works.

And writing your own is the source of tremendous power and capability.

Once you've got the language syntax in place is a good time to start getting into that.

I'm going to then just list things that I haven't covered at that point.

By the time you get to this Topics to Learn Later module you will know how to program in C++.

You will be able to write simple programs, but you won't know all of C++.

And sending you out into the world like that would be a little bit like teaching you to drive and never mentioning the need to put gas in the car.

So I'll have.

Introduction and definitions of a number of different topics which, since you'll then be a programmer you'll be able to learn from ordinary material, fundamentals course for example, and to make sure that you really do know how to work the wipers and how to put gas in that car.

And then I'm going to wrap up the course with some things you might see in C++ programs, but that I would hope you would never yourself write in a C++ program.

Because it's a language that's changed over the decades.

And you need to be able to read these things and to understand what's happening if you meet them.

So I've saved them for the end.

For more detail you will probably go to other material on those constructs.

But, first things first, we need to get started.
Module Overview

In this module I will first explain to you what the tools are that you need to build a C++ application.

Something that's intriguing about C++ compared to some other languages, is that there are multiple vendors of compilers for the language.

Unlike some other languages you could mention that belong to just a particular vendor and they make the compiler, this is something that's out there.

A specification for it is not the property of anyone individual or company.

In this course, I'm going to use a free tool called Visual Studio 2012 Express for Desktop, but you could also use gcc the new C++ compiler either for Windows or for a Linux flavor.

I will talk about what a compiler is, I will talk about what a linker is, I'll will show you how to get the tools.

Then I will show you the simplest smallest it does nothing C++ application.

So you that you can understand some of the structure and some aspects of the syntax.

Then we will go into compiling nad linking, which together are called building.

That application, and then running it, so that you will have actually executed a C++ project by the time you get out of this module.
Text Becomes Executable

In any programming language, you start with text, letters, words, bits of punctuation that you type into a file.

But that's not what is actually executed when you run your program.

That code, source code, needs to be transformed into executable code, and in C++ that's a multi-step process.

First, there's a step called compiling, the compiler takes your source code and transforms it into what we call an object file.

If there are problems along the way you get error messages from the compiler.

And if you have a real application, say a game or something to control a nuclear reactor or something to calculate the payroll for a whole big company or whatever.

And it won't be made of one giant text file.

It'll be made of a number of individual separate text files.

There's lots of good reasons for this, including managing who's working on what files and saving the time and effort of building, because you only build the files that have changed.

So when you have multiple files like this in a larger application, they're each compiled and then the object files get linked together to create an executable.

An executable is perhaps an overgeneralization, it's actually possible to make libraries and things.

But in this course, we're going to start simple, and we're going to make executables.

So just as the compiler will you give you some error messages if it can't compile, so the linker will give you error messages if it can't link.

And part of the success of being a C++ programmer whose not frustrated and annoyed all the time is understanding what your error messages mean.

For a lot of the time that includes understanding where your error messages come from.

Once you've made that application that executable, then you can run it.

And it will probably talk to you in some way.

When things go wrong, sure there'll be error messages, but there will also just be regular messages, like welcome to the nuclear reactor running system, or whatever.

And of course, if you've played a game, or used any kind of application on any operating system, you're well aware that you can interact with it in a lot of different ways.

Maybe by typing, maybe by clicking with a mouse, maybe by touch or maybe it reacts to hardware in your device, and you don't deliberately reach out and tell it to do things.

Yet it does react and do things.

And those are happening, we say, at runtime.

The three times that are important in the life time of the C++ program are at compile time, link time, and run time.
Tools

Do you want to start? Of course you do.

So you're going to need a few tools.

They can be incredibly minimalist if that's what you'd like.

You need something to edit text files, and depending on the operating system you're using, I'm quite sure there's an editor that just comes with it.

So if you're using Windows, it's notepad.

The different flavors of Unix come with different built in editors, but they're there for you.

And you need a compiler and you need a linker, and sometimes they are combined into a compile, LINQ tool, that's fine.

These tools can be a command line, where you type and cause them to execute, or you can have a full-on development environment.

And in a development environment you'd have, an editor that understands code, for example, and maybe even helps to find your mistakes for you before you compile.

You'd have tools that help you code more quickly or help you write better code.

These include a debugger, static analysis, diagramming tools and also Libraries of code that other people already wrote.

Frameworks of code that other people already wrote.

So that you don't have to write any of that and you can just get started writing the part that's unique and special to you.

Now which libraries you use and which frameworks you use depends on what you're trying to write.

If you're trying to write a game, maybe you're going to write DirectX.

If you're trying to control a nuclear reactor or figure out how much to charge people for their insurance policies, then you're probably not going to use DirectX.

I'm going to focus on the tools and the syntax in this course rather than teaching you a particular library or framework.

But of course you should know that they're out there.
Demo: Tools

This is the website ISOCPP.

org, The website for standard C++.

As I mentioned earlier, C++ is an international standard, an ISO standard.

And there's a Standards Committee for it that decides to add new keywords or punctuation into the language or to add new functionality into the standard library that comes with the language.

And this website is the home of all of that, so if you care about, you know, tiny minutiae, what we call being a language lawyer, you can find a home here, and argue about new or soon to be added capabilities and features in the language.

But it's also a wonderful destination for someone who's learning to use C++ itself.

So you may not want to read the working draft of the next standard, which would be C++ 14, but you can find, getting started articles, and conferences, and courses, and videos, and all kinds of information, here, free for the getting.

What I want you to find here is their Getting Started link.

Now, they have a responsive web design, so on this screen size, it's a drop down.

On larger screen sizes, you'll just see link across the top that says Get Started.

And that's obviously a great place to well, you know, get started.

And what they have here is a link of how to find assorted compilers, and I mentioned these very briefly earlier and I want to mention them again now.

GCC the GNU C++ compiler basically, is available for a variety of platforms; including Windows Clang, super popular, really hard to get going on Windows.

If you are using a Linux flavor, go ahead and use Clang you're going to be a very happy camper.

If you are using Windows probably not a great strategy.

Microsoft has a free version of Visual Studio called Visual C++ Express and there's two flavors of this for Windows Desktop apps and for Windows 8 apps and I'm going to use the Windows Desktop flavor of Visual C++ 2012 Express throughout the course for reasons of simplicity.

It is a code aware editor, it has some of those features all built in, so by installing one thing, you get a whole pile of capabilities at once and I can show you certain things very easily without having to teach multiple tools.

You don't have to use the same tool as me to follow along.

You're welcome to follow along in Clang or GCC.

So if you were to choose say GCC for windows, that will take you to this MinGW; which stands for minimal GCC for Windows, it's a distribution.

And it's super easy to download and install.

You simply click this link And it's a self-extracting exe, which you just run.

I found this incredibly easy.

I did try to do, get Clang working on Windows.

It was not incredibly easy.

MinGW was.

That's a great one to use.

There's a big list here of all the stuff that's in it and what it is and, and so on.

But you don't really need to know any of that.

All you really need to do is click on this exe and extract it.

Visual Studio Express is similarly easy to get.

If we go back to the Get Started page and click this link for Windows Desktop Apps, that's important.

Okay, you end up here, with a nice big download link, and you download that, and you follow the instructions, and you install the product.

I get that right now, it can be really hard to know which compiler you want.

I mean, you're just about to learn how to program.

You're just about to learn a particular programing language.

And you're supposed to choose what tools to get? But the good news is, they're free.

You can get them all and play around with them all.

If you're using Windows, the simplest thing for you to do right now is to get Visual Studio Express.

Then, as we go through the course, if you decide that you'd really like to try one of the other compilers, go ahead and do that.

All of the code we're going to write is going to work on all the compilers on all the platforms.

If you're using a flavor of Linux, you're probably going to want Clang and GCC.

And you can use apt-get and just get Both of those, two commands, app get install clang, app get install gcc, you're done, you have them.

I won't write code that requires you to be using a particular compiler.

You choose then change your mind, then change your mind back, then choose another one, it'll all be fine.

So if you're not sure, Visual Studio for Windows cling for Linux.
Command Line

I want you think about applications you've used recently on a desktop, on a laptop, on a phone, on a gaming console.

Chances are You didn't interact with that application exclusively by typing.

For example, if you are watching this course in a web browser, you interact with the web browser by clicking with the mouse.

And there is places, specific places for typing like the address bar for a url or perhaps there's a text box that you use to sign in.

But those are places that are the smaller of the UI.

Most of the UI is devoted to showing you what's going on in a very graphical and interactive way.

Touch-enabled, whether that's a tablet or a phone, you may never type at all.

And if you think about using a gaming console like an XBox, Typing there is truly awful, but you may for example sign in by having Connect recognize your face.

In this course, we're going to go way back in time to the Command line.

Because C++ is an old language, the very first kinds of programs that we wrote weren't interactive at all, they were what we call batch programs.

You'd write a bunch of lines of code, all of the input would be there with it.

It would run, it would give you the answer.

We're not going to go quite that far back.

We're going to go back to the command line which is all about typing.

So you type at the computer and the computer types text back at you.

The first Unix machines were like this and the DOS machines that came before Windows.

And on today's operating systems you can still get a command line prompt and it'll have different names on different systems.

For example, on a Linux box it's often called terminal.

And on a Windows' box it's often called.

A command prompt, and old folks like me might call that the DOS prompt.

And it's just text.

So, if I want to know what files are in this folder I type dir and it gives me a list of all the files in the folder.

It may seem kind of crazy to use an application like this but it's the very simplest to write.

You don't have to say now, this is mhow you use Windows, or this is how you use Linux, or this is how you use Mac, or this is how you use the phone or this is how you use the Xbox.

Because C++ works on so many different platforms.

And if you want to learn how to write a game, you first have to learn how to write the syntax and then you can learn the framework that helps you write a game.

If you want to write a phone application, first you learn the syntax then the framework to help you target the phones.

So by writing An application that doesn't really have any framework, that doesn't need to listen to the mouse and the touch and the sensors and the hardware but just text gets typed in, text gets typed out, then we can focus on the actual syntax of the language.

Which is enough to start with, and then you can move on into learning a particular operating systems foibles, a particular framework's capabilities once you have the language.

Now I understand that some people may have no experience using Command Line prompts at all.

I will show you enough of how to work one that you can follow along and do the demos that I'm going to do with you.

And you will want to go away so learn all the glorious capabilities of the terminal prompt in your linnex distribution or your particular shell that you're using.

You want to go and learn all the glorious capabilities of the command prompt in windows and maybe a power shell.

That would be a whole different conversation.

I'm just going to show you enough to be able to run these little minimal applications that we're going to write.
Smallest C++ App

It's time to show you some C++ code, I told you about the tools you need to get, showing you where to get some of them.

I've warned you about the command line, and now I'm going to show you a tiny little C++ application, it doesn't do anything.

It doesn't print anything on the screen, it doesn't calculate anything, but it is an application.

And, even in this, just four lines of code, we can learn some things about C++.

First of all, it's a case-sensitive language and as you can see, the language itself is very partial to lower-case letters.

I'll explain what each of these words means as we move forward.

Most of the sort of, instructions that are in your C++ application to the language itself are going to be in all lower case, and if you type capital letters.

You're going to get errors which sometimes will not appear to make sense to you if you think that the upper and lower case letters are kind of the same.

The other thing you can see just in this tiny little app, is that we have two different kinds of brackets.

The ones on the first line, some people call these round brackets or parentheses.

On my keyboard they're capital nine and capital zero are different from the ones that are alone on their own lines, on line two and four of this tiny little sample.

Those ones, people call braces.

Or brace brackets.

They call them curly brackets, curly braces, face brackets, squiggle brackets.

They have lots of different names and they're very different.

They serve different purposes in the language, and I will show you when to use round brackets, like you see right after the word main and when to use braces like you see there on the lines by themselves.

But all of these brackets, and there are plenty more waiting for us, other kinds of brackets as well, they're always paired up.

They begin and they end.

Now C++ as a language does not care about what we call white space.

So I could write this whole application all on one line or I could spread it out over multiple lines.

I could have a line break between int and main.

I could have a line break between return and zero, it just wouldn't be very readable whether I smooshed it all together or stretched it out over lots of lines but the compiler would not care.

The compiler knows that your sentence is finished because you put this semi-colon symbol at the end of the sentence.

Same as when you're writing out a sentence in English, you put a period at the end of the sentence.

If you leave off that punctuation to say that's the end of this line and time for another one, you'll typically get an error because Rather like a run on sentence in English, the compiler gets confused and can't understand the two things that are sort of glued together because that symbol is missing.

And finally, this application has the word main in it, and the applications I'm going to show you throughout this course are going to have this structure but It is fair to point out that some other kinds of applications wouldn't have the word main in it.

Depending on the platform you were targeting and the kind of executable or library you were creating, there might be a different sort of magic word that you have to use but.

With the work we're going to do together, it's always going to be main.

Just don't believe that that means that it's always main for everything for all time.

It is, though, for these console applications.
Demo: Smallest C++ App

This is Visual Studio Express 2012 for Windows desktop.

I've installed it and I've created a solution and typed the same code that you saw in the slide into it.

And I mentioned that Visual Studio's a large project with a lot of capabilities.

And one of its capabilities is that you don't just type in a file of code.

And then compile it.

You create a solution and that solution contains one or more files of code, and then you build the solution which is to compile and link all the files.

When you only have one file, that can feel like a lot of overhead, so here's our file with its four whole lines of code.

Here is the folder that Visual Studio created and populated for us.

And you can see there are all these kinds of files that don't have our source code in them.

Instead they're kind of metadata about the project and about the solution.

And specifically this SLN file is the one that you would double click to launch Visual Studio in, and edit all your files at once in this integrated development environment.

And a solution has one or more projects, each of which is in their own folder.

So if I go into this small folder then I see that small dot cpp, my actual source code.

Along with some more meta stuff, that's about the project underneath my solution.

So I'm going to build this application now, on the build menu choosing build solution.

And we get output down here.

We actually get two lines of output.

This believe it or not is significant.

The first line is about the compiler telling me that it compiled the code.

And the second one is about getting it linked into this executable small dot exe.

If I go back to the folder for the solution, you'll see there's this new folder created in there called Debug.

If I go into there, there is Small.

exe.

And you can run any application by double clicking it, but this one doesn't do anything.

So when I double click it, it's going to appear and disappear, there.

Kind of a blink if you missed it situation, so, what I like to do is open a command prompt in this window.

You might not know you can do this, but if you shift right click on the background, you can choose open command window here.

And this gets me one of these command windows.

Let's, I mentioned before the directory command, DIR, to see what files are in a directory.

You can see there small.

exe the same as you can see it by looking, which is a lot easier, in the windows explorer, but then if I type that name, small.

If presented the application actually runs and since it doesn't do anything you can't see any output.

But you didn't see any errors and you didn't say like if I just make up words.

It says well that's not recognized is in internal or external command up above program or batch file.

And we certainly didn't see that when we search small That's because small is a program.

It's been written and it's there.

And while it doesn't have any output, it does exist and you can run it.

Now you don't have to open a command line to run your applications, you can also run them right from inside Visual Studio.

So if I choose debug, start without debugging, application will run, do nothing and then this press any key to continue actually comes from Visual Studio.

So, if there had been some output on the screen, I would get a chance to read it and then press any key.

And we exit.

I told you, you can do these things with any tool, you don't have to use Visual Studio.

So if you went off and installed MinGW, you will get a folder like this, with a handy little batch file called open_distro_window.

bat, which will give me a command prompt that's all set up to be able to use this tool, GCC Now, when you are looking at a Windows Explorer, you look at different folders and you work on different files depending on which one you're looking at and the same is true of a command prompt.

Right now, this command prompt is all set to work on files that are in this MinGW folder, which is not where my code is.

I want to change directories I'm alt tabbing to bring my debug window back.

And then, lots of experienced people don't know how to do this, but it's a really useful thing to do.

I could click out here, copy this path, which is long and complicated.

And then come over here and paste, but pasting in DOS prompts is difficult.

Instead, I'm going to click this little folder symbol, and drag it here.

Let go.

Press Enter.

And now I'm in the folder I want to be in.

Do a directory, you can see that the, small.

exe and so forth are all there.

I want to go back up.

Dot dot take you up one.

And do a directory here and then into small and do a directory here.

And I am in with the code.

Small.

cpp.

The GCC compiler that I am going to use doesn't know that visual studio exists, doesn't understand what an sln file is or a vc proj or a vcx proj or any of that.

But it does know what the source code is and that's just fine so I'm going to compile the exact same source code, not some special copy that I happen to have put the same thing in but the exact same file using the GCC tool.

GCC small.

cpp.

Silence.

One of the things that's strange about these command line tools, and it comes from their Unix history, is that silence is golden.

If there are no errors, there are no errors.

They don't say, that was great it all worked, right? Visual Studio did.

Visual Studio said, let's build it again.

All, you know, succeeded, everything's good, kind of gives you some feedback.

But the command line tools, you know, they say nothing because, there's nothing to say, everything was fine.

But, did it work? Well, if I do a directory again, there's a new file here now called a dot exe by default, that's what it makes you.

There are some command line parameters that you can say what you want for the name of the executable, but want to keep our life simple when we're just getting started.

So now we have a, and if I say a, it runs.

I know it didn't say anything, but it didn't say an error, right? Like if I just randomly said hey let's run B, I'd get that error about not recognizes internal or external etc.

So now with two different compilers, the exact same source code, you've actually made an application that runs successfully.

It has nothing to say, it doesn't ask you anything.

But it does run, it is a program and you have created it by compiling.

Either with Visual Studio or with GCC.

Now, for the second completeness let's go to this virtual machine running a Linux distribution on which I've installed Klang.

And I have that very same small dot CPP here Exact same code.

The coloring is because this particular editor does know a little bit about code and gives it different colors depending on what kind of part of the application it is.

I close that.

I have a prompt here and I can say, Clang Small dot C-P-P.

Silence which means it all worked great.

L-S to see what files I have.

I have an A dot out, So I'll run that and again silence, but you know If I said that I wanted to run b.

out I'd get an error message cause it doesn't exist, so we have succeeded, also in our Linux distribution of compiling that small dot CPP and running it.
Errors

I really want you to follow along in the demos that you see in this course.

When I show you some code and then I compile it and I run it, I want you to compile and run that same code.

Even something as simple as this four line nothing application.

Not getting any error messages when you compile it And not getting any error messages when you run it or how you know that it's working, and how you know you have things installed properly, and you're using them properly.

In real life we make errors, and the tools tell us about them.

The problem is that they come from the point of view of assuming that you're to trying to make sense.

And when they try to figure out what you really meant It always doesn't work out, so seeing some of these errors and events can help you to understand that, and learn how to fix mistakes that you've made.

And remember, there's two steps in turning your source into executable.

There's compiler errors, and there's linker errors, and they're different.

As well there are compiler warnings, and very important when you're first getting started not to ignore warnings, actually to tell you the truth it's very important when you have 20 or 30 years' experience too and I tell people with that level of experience to stop ignoring warnings all the time.

But it's very important when you're just getting going.

You may feel like worry about warnings later when I know more what's going on.

At least it's working That warning may be telling you that at runtime, something is going to happen that's really not going to work for you.

So don't ignore warnings.
Demo: Errors

Let's create some error messages.

I'm going to deliberately take away this semicolon this is a typical beginner mistake to forget the semicolon at the end of the line and the compiler will of course tell you about that mistake.

So if I go on the build menu and I choose build solution It says syntax error, missing semicolon before brace bracket.

I can find these errors in the error list a little hard to read sometimes, so I prefer to see them in the output window.

If you don't have an output to click on down here, to go in the view menu, you can choose output, and you'll see it that way.

Now remember before we had two lines of output, one said small.

cpp and one said that it made an exe but this line doesn't say I made an exe, it says error.

Missing semi-colon before brace bracket, and the summary 0 succeeded, 1 failed.

I'm going to go over to my command prompt for GCC, and try compiling this one, up arrow by the way, repeats old commands in a command prompt.

And I get the arrow here, it's a little different.

It says Small.

cpp 5 colon 1 error expected semicolon before brace.

It shows me the line that the error is on with this little hat pointing at the exact problem.

Which on a line with only one character is not very useful but I will say is fantastic if you're on longer or more complicated lines, and this five one.

Let's go back to visual studio, is referring to line five.

Position 1 column 1, Visual Studio tells you what line and column you're on down here.

So it's complaining about this You may think that's kind of weird.

Your problem is actually on line 3 out here at column 13 when you don't have a semi colon but it doesn't know that's a problem until it gets down here.

Because if you wanted to, you could spread things out over multiple lines and say, you know, return zero plus seven.

And while that's strange, it's legal in C++, and so there's no mistake.

It only knows there's a mistake once it hits this brace and says, wait, I didn't get a semicolon yet.

Something's wrong here, you may also notice there's these we call, highly technical term, red wiggles underneath this brace.

Visual Studio is a code-aware editor and it actually knows there's an error here, and is telling you about it before you compile.

But again, it's telling you about it after where the problem really is, so you have to come up here to fix it.

Now before I move off this tiny little error, I want to show you something that makes Visual Studio very useful for someone who's just getting started.

Every error has a code, this one says, c2143.

C for compiler because it's a compiler error, and if I click in there, and press F1.

We're going to launch a browser, assuming you're online, it's going to look that error up.

And explain to me what's wrong with it.

There's quite a lot explanation.

She can, read all of if you really really want to.

Plenty of examples of why it might be an issue but what I find the most useful on this page, and it's in the first page of the information, is here.

Because the compiler may report this error after it encounters the line that causes the problem check several lines of code that precede the error.

And that's in fact exactly what happened here, although we were told the problem was down here on line five, this guy is also saying line five by the way, the problems really on line three and so that little tip in the online help could actually save you a ton of frustration.

Be aware that, that help is there and read it and it will make your life simpler.

Now I'm going to make a different kind of mistake.

I'm going to put the semicolon back so that our code will successfully compile.

And I'm going to change this magic word main to man.

You don't know why it has to be main yet, this is one of these things that I'll explain better later.

But trust me, once it's not main, that's a problem.

But it's not a problem for the compiler.

So, if I build again, and go to the output, it's happy enough to compile it, and there's no error messages, but then it starts to link it together into my executable, and I get a linker error.

And you notice this error starts lnk instead of c.

And the message itself is kind of odd unresolved external symbols.

Something about main but it's not exactly the same main that we were using.

If I ask GCC to give a whack at it.

It says undefined reference to win main at sign 16.

Which is odd, but at least contains the work main in it.

The reason these error messages are a little bit opaque is because of the way that Windows works and the way that console applications work.

If I, go cause the same problem over on my Linux box.

Let's go into the application.

Mess up the name.

Save it.

Clang it.

And it says undefined reference to main.

I told you that a console application has to be main.

You don't have a main, you have a problem.

And you don't just have a problem when you run it, but you actually have a problem when you're linking it.

And you see it says, linker command failed.

If I fix that and try having the same compiler problem on Clang that we had on the Windows compilers.

You can see the Clang messages.

Really, Clang has the best error messages of anybody, I have to say this.

It's as expected semicolon after return statement.

And it's actually pointing to where the problem is instead of to the next line.

And there's really been a ton of effort put into giving you that kind of support and help in Clang.

Just put this app back to being good, and put this one back to being good.

Now, I will give you more sophisticated error messages and some warning messages as time goes by.

When we start to write applications that really do something, but even with this tiny little four line application You've seen compiler errors, and you've seen linker errors.

And you've seen that the errors are similar but not identical across the different tools and that knowing which tool is complaining can help you figure out what you need to do about it.
Summary

We've come a long way for a first module.

I've showed you that C++, unlike some other languages, can be built with a wide variety of compilers.

I'm going to use Visual Studio Express for Desktop.

You can do so as well, but you can use whatever you like.

And you may have noticed, I didn't show you how to create a solution or create a project in Visual Studio Express for Desktop.

If you would Like to follow along.

There's documentation in the product itself and online to create a new C plus plus Win 32 project.

Just delete the code that it gives you, and put the code that you saw me using in the demo.

The generated code that visual studio produces for you is a little more complicated than I'm willing to explain right now.

And that simpler four-line version will compile and will run.

And that's what we're going to start.

If you want to use one of the command line tools, you can edit your code with whatever you like, and compile it from the command line, as I showed you.

C++ doesn't belong to a vendor, to some compiler company.

It belongs to the world, and it's looked after by a Standards Committee.

Sometimes you'll buy a tool and start using the libers that come with that tool, and you end up taking a dependency on that tool or that platform.

And your code will only work under those circumstances, and that may be fine for you depending on what you're trying to write.

If you want to write a Windows application, The fact that your application will only run on Windows probably doesn't upset you.

But the code we're going to write together in this course will run everywhere, and it's going to be completely standard C++ without dependencies on frameworks, libraries or operating systems.

So you learned in this module how to build source code into executable code.

There's a compile step and then if that succeeds, there's a link step, and then you can execute.

You can execute from inside Visual Studio by choosing start without debugging.

You can execute from a command prompt by typing the name of the executable.

And you can execute by double-clicking, on the XC in Windows Explorer, which if it had any kind of user interface, it would be great, because it would bring up the user interface.

We're going to write console applications in this course, and console applications have that particular structure.

You have to have that function called main, otherwise you get linker errors, and those are going to be the kinds of apps we're going to write throughout this material.

And starting in the next module, going to write applications that actually do something.
Streams, Locals, and Flow of Control
Introduction

Hi, welcome back to learn how to program with C++.

My name is Kate Gregory and I'm introducing you to programming using C++.

In this module, I want to take your ability to put code in a file and compile it and then run that.

And move on to writing applications that actually do something.

The very first something I'd like an application to do is to put something on the screen to show that it actually ran and it really was there.

In order to do that, I need talk to about libraries, and then stream IL.

Once you've done that, and you get that.

Then you can move into the sort of meat and potatoes of every application you ever wrote.

Local variables, and controlling the flow of your application, making decisions in code.

Repeating yourself if necessary in code.

Those fundamental building blocks, the idea of local variables, and working with them and making decisions or taking action based on them, is what all applications are built out of.

The ones you'll write in this module will be very simple, but they are the building blocks for the more complicated things that you can build later.
Libraries

The first sample application I showed you in the previous module did literally nothing.

It didn't even print hi there on the screen, or say, this is an application running.

There was no output at all, the only way you knew it ran was well you don't get an error message.

And if you just make up a random file name and try to run that, you get an error message.

Why? Why wouldn't I use whatever the C++ keyword is to make stuff appear on the screen and show you some output? And that's what lots of languages have, they have a word like print or back in the day when I use to basic was question mark which is the shortcut for print.

C++ does not have those keywords.

Instead, it uses functions and classes, or objects, which are instants of classes, to get things done.

It may not always look like we're calling functions.

I will show you calling functions in a further module ahead of us, but the key is the expandability of this mechanism.

Functions and classes can be distributed in a library and shared by developers all over the world.

This means that the language can be expandable without adding new keywords to it.

There is one particular way to get output onto your screen.

Then we stop writing console applications, and we start writing Windows applications, that's fine, we can have libraries that support Windows drawing things on the screen.

Then if we decide we'd like to run our application on a different operating system, we just need a different library that knows how to write things on the screen for that operating system, and so on.

My favorite library, and it's soon to be yours, is called The Standard Library, with capital letters.

It's also affectionately known as the STL, which stands for Standard Template Library.

I'm not going to explain what a template is at the moment.

The Standard Library comes with your tools, whatever compiler you're using.

If you're using Visual Studio, Express for Desktop as I am or if you're using Clang or GCC, whichever compiler you're using, you can use The Standard Library.

And the implementation of The Standard Library maybe a little bit different, from compiler to compiler, but the interfaces of it, the names of the things you call, the information that you have to give them when you call, the way they work, when they succeed and when they fail, all of that is identical from compiler to compiler, cause that's what a standard is all about.

In fact, many of the changes to C++ that we generically call C++ 11 where changes to this Standard Library.

Far more, really, than the changes to the language itself and to the key words and punctuation that make up the language.

So in order to do something as simple as put something on the screen, we're going to have to use a library.

But the good news is it's a library that's there, ready, waiting to be used.
Stream I/O

To put characters onto the screen, for a user, which would be you, to read, you use what's known as Stream I/O, the I/O stands for input and output.

And the cool thing about Stream I/O is that it can read input from the keyboard and write input to the screen.

Or it can read from files, write to files, or any other number of reading from sources and writing to targets as long as they support what's called Stream I/O.

And you might think that's the sort of default or only kind of I/O that there is.

But especially in the very early days of computing, we were big fans of fixed or record based I/O, where you might have a thousand line file, and you just want to change one line in the middle of that file.

And being able to move around at random access in a file or reading a record at a time is very different from the less structured streaming I/O.

Well, unless you're trying to write a database system, you're probably going to use stream I/O and certainly the simple demos that I want to show you, stream I/O is perfect for us.

There's a library available in The Standard Library that will support stream I/O threads, and this funny pair of operators that we will use to do the reading and the writing.

These are operators, they are special-meaning punctuation in C++.

And you create them by typing two characters consecutively on your keyboard.

If you remember doing, many years ago for you probably in school, where you had to answer questions like, is three greater than or equal to two? Yes or no? And that operator, greater than or equal to was built out of two characters, and in the same way these reading and writing operators, they're sometimes called the insertion and extraction operators as well, are made out of two characters.

To send something to a stream, you use the first one, greater than, greater than, but you don't pronounce it that way.

You call it the insertion operator, and to read something from a stream, less than, less than.

But, you would pronounce that as being the extraction operator.

Now this is probably easiest to show you with a demo.
Demo: Stream I/O

This is the same demo code I used in a previous module, the application that didn't do anything, and I'm going to change it so that it does something.

In order to do that, I need to gain access to that library of stream I/O.

And I'm going to add a command before the main, that will make that possible.

I'm going to include the library known as iostream into my CPP file that I'm compiling.

The actual mechanics of including is something we're going to come back to.

I warned you before that some of the things in this course we'll do once the simple way, and then we'll come back and explore some of the nuances.

For now, kind of think of it as a magic incantation.

You say, pound or hash or number sign, people love pronouncing that symbol in lots of different ways.

Include, angle bracket, iostream, end angle bracket, and presto, you'll gain access to the iostream library.

Once you have access to the iostream library, you can use some of the components that are there within it.

The output is represented by an object with the slightly odd name of std::c out.

It's tempting, I know, to pronounce that as cout or coot or something, but it's pronounced c out, that represents the console output, for our console application.

This symbol means I'd like to send something to cout, and let's send hello.

And like any line of C++, it needs to end with a semicolon.

Let's build this Good, one succeeded, always a good sign, and you may recognize now, we have the first line saying that it's compiling my CPP code, and then this second line saying that it's creating my executable for me.

I have a command prompt open to the place where it's made that executable.

And if I type, small, it says, Hello! Ta-da.

The application does something.

I might go back to this code, and I change this to, say, 2 plus 2, and I'm going to build it, and run it, it says 4, so that's kind of cool, it can actually do a little bit of a calculation right there in the output statement.

Now this operator, I often pronounce this as from.

I'm going to take this number, 2 plus 2, and send it to this c out.

Or if you read in the more general direction, you say, I'd like to write something to c out from 2 plus 2.

You can read in whichever direction works for you.

And then the official name of the operator is the insertion operator.

What if I wanted to do both the number and the word.

I was going to copy, Ctrl+c and paste, Ctrl+v this line, just so you don't have to watch me type.

And build it again.

I'm using a keyboard shortcut Ctrl+Shift+b just cause it's quicker than bring up the menus every time, and back over to the console.

Hm, it's not ideal, right? Maybe it'd be nice if they were on separate lines? Well, don't worry, the iostream library takes care of that too.

In between here, I can put.

Now, I'm sure that really does look like an incantation, so it starts with std::cout, which is the full name of this console output object.

And what I want to send to it this time instead of a word or a number, this represents an end of line.

I'd like to send it an end of line, so if I built this, and run it, now between the hello and the four, there's a line break.

Goes down to the next line, one more thing before I leave this.

This works as you can see we saw it work but it's kind of the long way around.

I keep repeating send this to cout, then send this to cout, then send this to cout and in fact, I can chain this all together into a single line like this.

Build it and get exactly the same output.

So, each of these things in turn is streamed to the console output in the order that we come across the line.

So, first, it sends Hello! Then, it sends the end line character.

Then, it sends the result from 2 plus 2.

And that's what you see on the screen.
Exercise: Stream I/O

I'd like you to try it.

I know in the module on getting your compiler together, finding your tools, I said oh, go ahead and try this yourself but, my guess is nobody did, and that's fine.

But you know in order to really learn to program, you have to program.

And you have to kind of, go through the thought process yourself of deciding how your application is going to work, trying to compile it, seeing some error messages, saying some bad words, fixing your error messages, and feeling like, yes I'm the master of you.

And you've got to go through that, so what I'd like you to do is to write your own version of Small.

And to build it and to run it, and to play around with it a little bit as I just did in the demo.

If you want to rewind to the demo and look at the code for Small on screen.

That's great, but maybe first try just doing yourself if you can remember that structure.

Couple of tips, because the compiler error messages, can be a little frustrating.

Make sure you use double quotes, and I don't mean that you press the quote key twice.

I mean the sort of, on my keyboard it's a capital quote that does two little apostrophe marks at once.

Around if you want to say hi there, or guess who the best new programmer is or any of that.

Make sure you wrap it up in those double quotes, don't use single quotes.

It means a different thing to C++ and the error message is unlikely to be useful.

End lines wherever you like, make sure you call them always by their full name, std::endl.

Don't forget your semicolons at the end of each line.

And you can type in some numbers, or you can give it some calculations, and you don't just have to do integers like 2 plus 2, you can try 1.

7 or 1.

7 plus 2.

3, and see what you get.

Now a few tips, don't, ask for things you know can't be done.

3 divided by 0 is infinity which can't be represented on a computer.

Hello plus 2 doesn't really make any sense.

What would happen if you try? Well, some of them will work but, really strangely and you'll be like, what? What, why would it do that? And I don't want to explain why it would do that just yet, and others won't even compile.

So just for now, be straight ahead ordinary, optimistic.

Just print some words, some small sentences, print some numbers, do some really simple calculations, and take the time, pause the video and do it now so that you've experienced compiling and running before we move forward.
Include

The first thing I did when I changed small to start writing on the screen was I added that include statement, include iostream.

You're going to have include statements in, I would guess, every single file of C++ you write.

In fact, many will start with a whole pile of include statements.

Each value include opens up these new capabilities.

Now, the nice thing about The Standard Library, is that you only need the include statement.

For other kinds of libraries, that oh, do image manipulations or difficult mathematical calculations, or even just a library that you've written to gather together some particular calculations or manipulations that you do regularly.

You also need to tell the linker where to find some of the code, but we'll get there a little later in the course.

Now, good libraries are in what's called a name space, and that's what was going on at the beginning of the names for cout and end line or endl.

They started, std::cout std::endl.

That's called a name space.

You can make your own name spaces, and if you use a library from someone else, they'll probably use a name space, too.

It's a fantastic idea, because it prevents conflicts, so I can have a class.

If I wanted to called cout, and as long as it was in the cake name space, there wouldn't be any conflict with the one in the STD name space.

And STD is short for standard, because it's The Standard Library, and nobody other than The Standard Library writers are allowed to put classes into the STD name space.
Local Variables

In our move towards writing an application that actually does something, getting a output on the screen is a start.

But, usually useful applications, they calculate things for you.

They help you to perform some business function.

And in order to do that, they're going to use what we call local variables.

I'll explain the opposite of local later.

Now, variables in C++, they're to hold information for you.

And a given variable holds only one particular type of information, so you might have a variable that's for holding a string like the hello that you saw in the earlier demo.

You might have a variable that's for holding a number.

Or a date, or something that the inventors of language never thought of, like employee insurance policy nuclear reactor.

So there are types that are built into the language like for holding integers, and types that are user defined.

And user defined type is an official phrase in the C++ specification.

And you have to understand that some of the users who define types are not you.

They're the people who wrote for example The Standard Library.

C out is the console out object that we were writing to, is an example of something of a user defined type, but the user wrote the iostream library, not us.

So a couple of rules.

You must declare a variable before you use it.

You can't just wander around and start putting a value into something called X, you first have to say, hi compiler.

I'm planning to use a thing called axe.

And the reason for that is because you need to tell the compiler what x is going to be for.

It's going to be for strings or it's going to be for numbers, or it's going to be for dates.

In general, the built in types are not initialized for you and the user defined types might be or might not be.

It's a decision that's made by the person who writes the user defined type.

But the built in types never are.

So for example if you have an integer, and you just say, oh I've got this integer, you can't wander around using it hoping that the compiler would know that 0 would be a great value for that integer to start at.

It will literally contain whatever random junk was in the memory.

That has been assigned to it from some other application that ran yesterday.

That's a really bad plan.

You always want to make sure that you initialize your types yourself.

And the compiler will generally warn you if you don't.

And finally there are a whole pile of rules about type that are best demonstrated to you by seeing some code, I'm watching what happens when it runs or when it compiles, or when it fails to compile.

Because the rules around typing C++ really underpin everything you do.

Might as well start by taking a look at how they work simply and is just going to provide that foundation as you go forward.
Demo: Local Variables

In this demo, I'm going to set up some local variables, put values into them, and print their values out.

You can kind of follow along and see how the work that you tell the computer to do actually gets done.

You know, one of the really annoying things about programming language is, is they don't always do what you want, they just do what you say.

And, if you don't say it quite right well, you don't get what you wanted.

And you have to learn to express yourself in a way that will get you what you want.

So I'm going to add quite a lot of code into this little application.

And I'm going to do something of convenience first.

I told you about namespaces, this std::cout, and std::endl.

They're both in the std namespace, and if I was using a number of libraries, and there was a possible conflict between a c out in one library and a c out in another library, it'd be great to hear how I was calling them by their full name all the time, but I'm not using any other libraries.

There's no chance for conflict or confusion and I don't want to have to keep typing those five characters every time I write anything on the screen.

So, I'm going to take advantage of a convenience that the language offers.

I've said here, using name space STD.

That instructs the compiler, when you come across the something, and you can't figure out what it is, see if it makes more sense to put this name space in front of it.

And then you'll know what it is, and if it's, that works, great.

Carry on about your business.

So having done that, I can take these characters away and get exactly the same effect.

You notice that the red wigglies that you occasionally see when I have an error are not there, and if I build, works just fine.

And if I pop over to my command prompt, and run it again, it still says hello and four, so it still runs just fine.

So it's the same application, I just use that convenience, using namespace expression in order to not have to type so much.

Now it's not always the right thing to do and we'll be revisiting the using namespace later when we get into more complicated applications, it's the right thing to do here.

So let's make a couple blank lines on my output.

Just so that I can kind of break it up into segments, and I'm going to show you declaring a variable.

This line says I'm going to use a variable called i, that's its name right there.

Remember, C++ is case sensitive, so capital I and lower case i are different, and i is of type int.

The type always comes first before the variable name, so this line says, I'm going to be using a variable called i and it's an integer or if you like, I'm going to be using an integer called i.

Now Visual Studio actually turns the word int blue, because it's a keyword, it is a built-in type and part of the language.

Now I'm going to do what I told you not to do, and that's use it without initializing it.

So I've declared it, I haven't initialized it, and I'm going to say, hey could you just print that value out for me.

So now I'll build that with Ctrl+Shift+B.

And we get some output here, extra line.

It's just a warning.

It says warning, C4700, unintialized local variable i used.

Remember I told you especially as a beginner, do not ignore warnings.

But, hey, I'm not a beginner, I've been paid to program since 1979, so what do I care about warnings, right? Let's run it.

Oh, that was kind of sad, it blew up as I tried to used something that had not been initialized.

This is what's known as a debug build, and has these sort of checks in it that cause it to blow up when you make certain kinds of programming errors.

Solution, obviously don't make programming errors.

So, let's give poor i a value.

Now, if I build.

Back to only two lines of output, that's a good sign.

If I run it, prints out the value 3 for i.

One of my little sayings, my friends like to tease me with it, but it's true.

The compiler is your friend, I had an error of thought.

The compiler warned me about it.

But by now, it's fixing it, ended up with a runtime error.

The problem with runtime errors is you know who finds a lot of those? Users, your end users, they never compile your code, right? They run it.

If you can find the problem at compile time, you can fix it.

If you ignore it, and then you don't happen to run into it because you have a big, complicated program that does lots of things and you don't exercise that part.

Then you ship it with a giant, glaring bug in it.

The compiler will save you from yourself if you give it a chance.

Now you don't have to declare and initialize on separate lines like that.

You can say this.

I'm just going to copy this line with Ctrl+c, paste it with Ctrl+v, because there's no medals for typing and you don't need to watch me type all of that.

So now I'm declaring j and giving it a value at the same time.

Int j equals 2, so i and j are two separate variables.

They have separate names, they're kept in separate memory, and of course they have separate values.

If I change the value of i, it doesn't affect the value of j, and vice versa.

Let's run this.

j was two, so we see hello and four there from the old one, three for i and two for j.

Excellent.

So now let's trying doing some hm, stranger things.

Let's come back here to i, and change its value to, 4.

3.

And I'll change j to 7 divided by 2.

Let's print these.

I'm going to use Ctrl+F5.

That's going to build and run all in one.

Now you probably weren't expecting that.

Let's get the code and the output side-by-side.

I said i was 4.

3, but it's printed out 4.

I said j was 7 divided by 2, which is 3 and a half, and it's printed out 3.

Maybe there was an warning that I didn't look at, let's go back to our output.

Sure enough there is a warning on line 11 that says equal sign.

Conversion from double to int, possible loss of data.

When I was talking about type, I just said, numbers, but in fact, inside the computer, the way the calculations are done for floating point numbers like 4.

3, different than the way they're done for integers, like 4.

And C++ is a language that's close to the metal, and it cares that they're stored differently.

So in C++ we distinguish between a variable that's going to hold an integer, and a variable that's going to hold a floating point number, like 4.

3.

Now the error message mentioned double, early computers didn't have a lot of memory, didn't have a lot of space and floating point numbers were quite small and the doubles are double positions could hold large numbers or more decimal places of precision.

By default when you a type a number like 4.

3, it's taken as a double.

Whether it's a double or a float it can't go into an integer without losing, in this case the 0.

3 part, and that warning was actually telling me that.

Possible loss of data.

Interestingly there wasn't a warning here, this is line fourteen, I go back to the output.

Right? There was only a warning on 11, now let me show you something else, I'm going to change this to 4.

9.

And I'm going to change this to 9 divided by 5, and we'll run again.

With Ctrl-F5.

So the 4.

9 comes out as 4, and 9 divided by 5, which 1.

8 comes out as 1.

When these real numbers, like 4.

9 are converted to integers, they're not rounded, the fractional part is just thrown away.

That is almost certainly not what you want, so you need to know that it's happening so that you can get what you want.

So instead of using the integer i, I could make a floating point number called f, and say that's equal to 4.

9.

I'm just going to copy this line.

Paste it, print out f and then maybe I'll change the value off from 4.

9 to 9 divided 5, and then print that out, okay, let's try it.

So the 4.

9 still truncated to 4, and the 1.

8 still truncated to 1.

And here float F 4.

9 prints out 4.

9 yeah, progress.

But 9 divided by 5 is still printing out one.

The reason is that in C++ expressions have types as well.

This expression, 9 divided by 5, involves only integers, and the rule that the language enforces.

You might not agree with it, it might not be what you'd do if you invented a language, but the rule that C++ enforces is, if everything that's participating in the calculation is an integer, the answer is an integer.

So, what this calculation does is, it takes 9, divides it by 5, gets 1.

8, throws away the fractional part, 1, that's an integer.

And then says oh, let's put this integer 1 into f, and there's no problem putting an integer into a floating point number, you get 1.

If you want this calculation, 9 divided by 5 to produce a floating point real number.

For the answer, you have to make sure that at least one of the numbers involved is a floating point number.

The easiest way to do that, 9.

0 divided by 5.

Let's run this one more time.

There we go, now we get 1.

8, because one of the numbers participating in the expression was a plotting point, so the answer is kept as a floating point which can then be put into f no problem.

Let's do some silly things, because we've had some warnings about losing information but we didn't get any errors.

So, imagine if I go, i is equal to hello, or f is equal to 1.

0 divided by hello.

Visual Studio is right away giving me some errors.

But I'm going to build it so you can see the errors because you may not be following along in Visual Studio, and you may not be using an editor that shows you errors.

Oh, and now we got full on errors, and the list error list comes up, on line 22, and I can double click to go to the line.

It said I can't convert from okay this probably doesn't make any sense to you, but really doesn't matter.

I can't convert from mumblymumblybumbly to int.

It can find a way to convert, you know, 4.

9 to an int by throwing away the 0.

9.

But it really can't figure out how to do it for hello, and this next line says illegal.

Right operand has type again, that same type, and, the right operand, this is the left, this is the right.

And then, there's some more complaining, you can't assign this to that, and, general, what do you think you're doing? And, this is the rules about type, you can't create expressions that represent nonsense.

You can only perform operations that are allowed for certain types, we can add, subtract, multiply and divide integers.

We can add, subtract, multiply and divide two floating point numbers, and we can mix and match, integer times a float.

Float plus an integer, we have the power to figure all that out but then you want to try to bring some.

Words into the mix or you know, what's Tuesday July 13th divided by 4? It doesn't even make any sense and the compiler basically says, what you're trying to do is not allowed for those two types.

I'd like to leave these lines in the file so those of you who download the code can see them, but I don't want them to stop me from compiling, so I'm going to comment them out.

C++ comments start with a pair of slashes.

There's another variant of the comment as well, but these are the kind I like to use, starts with a pair of slashes, and the whole rest of the line is a comment.

You can put anything in a comment.

It can be code that you're not using right now.

It can also be an explanation of what you're doing.

So for example, I could come up here and put a comment that says, fractional part will be lost.

And now that comment stays in my code and explains to people who are reading it, what it's doing.

So with the offending code commented out, if I build again, I'm still getting some warnings.

Setting my types back and forth between doubles and floats and doubles and ints, and it's upsetting that maybe I would lose some data.

It's just going to warn me about it, because maybe I'm doing it on purpose.

As long as I don't mind losing some of my numbers, my application isn't going to blow up or refuse to work or refuse to compile, so it's just a warning.

But remember what I told you about warnings.

Don't ignore warnings as a beginner.

But one more thing before we leave the concept of type.

When I said i is equal to 4.

9, the compiler knew the type of 4.

9.

And it knew the type of i.

And it knew didn't really go together, sometimes your mistake is not in the number that you choose to put into the variable, but in the type that you declare for the variable.

Like here, perhaps this would've been better as a floating number.

On days like that, when I say oh, duh, should've made this a float.

I do sometimes say to myself, you know, compiler, you're so smart.

You knew, that the type on this side of the equals sign was not compatible with the type I was using.

Why couldn't you have just done the type for me? And in fact, it can.

If I hover over i here, Visual Studio shows me that it is in integer, Int I.

And if I hover over my newly declared changed J it'll tell me that it's a float.

If I take this F and change it from float to auto Auto is not actually a type.

Autos are requests to the compiler.

Could you please figure out what the type of this variable should be for me? Let's do it for this one also, and let's make it unambiguously an integer value, this is an important point.

j and f still have types.

j is in fact still an integer, and f is still a floating point number.

And, if I try to put value f into j, it will actually get me a warning.

Let's do a little hovering, j says int j in that little box that popped up.

I didn't have to type the letters INT.

Actually, typing the letters AUTO is more work than typing INT but there are lots of types in C++ that are 50 characters long.

I'm not even making that up, so, auto looks like a bargain then.

If I hover over f, says double f, and that float because as I mentioned before when you type a literal constant like 4.

9 it takes it as a double.

I am going to comment out some of these other lines just so that the warnings don't confuse us.

We can be confident that the warnings we are getting are from our code and I'm going to build.

Two warnings.

Warning on the equal, conversion form double to int, possible loss of data, and unreferenced local variable.

I commented out the only use of I and it's like hey you declared I and you never used it.

What are you doing? That was nice of it but let's focus on this one, conversion from double to int.

This line, j equals f, is causing that.

Okay, although we used auto for both of them, they're not of type auto.

J is an integer, f is a double because that's the value that was put in it.

And when I try to take that double and put it in the integer j, the compiler's like, are you sure? Is that really what you want to do? And the answer of course is no.

But this is some code to deliberately show you some things that are little bit scary as well as some things that are normal.
Type Safety

Just to summarize what you saw in that demo about types and type safety.

C++ enforces type.

It's what's known as a strongly typed language.

So, variables all have a type.

You've met int, and float, and double, and you'll meet a lot more as we go through.

And expressions have a type.

So 2 plus 2, everyone involved that is an integer, is a type integer.

1.

0 divided by 3? Someone in there is a double, so it's a type double.

It's okay to promote a value into a variable.

So if you have an integer, like three, and you want to put it into a float or a double, becoming 3.

0 to however many digits of precision your float or your double have, that's fine.

We didn't lose anything.

If you demote, like putting a folding point one into an integer, you'll get a warning from the compiler.

You won't get any kind of runtime error but you will get runtime if you want mistakes.

Because you will see one on the screen where you thought you would see 1.

8 for example.

And finally some things you just can't do.

You can't put a word like hello and put it into an integer, or multiply it by 2.

3, you just get flat out compiler errors if you try to do that.
Flow of Control

There's one more piece to the puzzle before you can write an application that actually shows some form of intelligence, and that's what we call flow of control.

Normally, your code starts at the top and runs down to the bottom.

That's what you've seen in all of the demos, it's so intuitive that we don't normally point it out.

The lines at the top of the file run and then the next, and then the next, and then the next, and you see the output come out in that order.

But there are keywords in the language that change that, you can say if something is met, do this stuff.

And if it's not met it won't do that stuff.

This is you know, the classic way that decisions can be implemented.

If you're writing a game and you have to hit the monster until his hit points get to 0 in order to get past him, then there's sort of a consistent check that says if the hit points are still greater than 0, you can't get past him.

Some ifs, not all, have what's called an else.

Let's you do one thing or the other, do this if the condition's met, do this other thing when it's not meant, you would never do both of those things.

There are also keywords while and for that let you arrange for things to be done over and over again, so if you need to open a file and process all the data in it, you could have a while loop, let's say while there is still more stuff to process, process some stuff, and it would go around and round and round again.

The for loop is a little more structured.

I will show you that, but it's excellent for things when you know you need to do something five times or ten times.

That kind of stuff.

Now all of these keywords work with conditions that are written out as logical expressions.

So an expression like x is greater than 0.

That's true, for say, three, and seven and 4 million.

And it's false for 0 and minus 2 and minus 4 million.

It's either true, or it's false.

I'll give you a brief list of these operators that can compare two, we call them operands.

There's greater than, greater than or equal to.

Less than, less than or equal to, is equal to which is built out of a pair of equal signs and that's very important, and not equal to.

The exclamation mark in C++ means not.

Now, some of these, you can see, are kind of the opposite of each other.

The opposite of greater than is less than or equal to.

The opposite of greater than or equal to is less than.

The opposite of is equal to is not equal to.

But it's convenient to write them, using the operators you want to use so we have the full set.

And each of these will give you back an answer that's either true or false.

And when you combine those with your if, and your while, you can actually start to make something real.
Demo: Flow of Control

I've started an application for you to read your way through.

And I'm going to show you what I've done.

I'm using the iostream library, and the namespace standard, convenience.

And I'm declaring two local variables, both integers, i and j.

And then I'm writing on the screen, enter a number, and then this is a little new, we have c in, this is the console input, the same as the console output.

And you see the arrows are kind of going the other way, we're using the extraction operator.

We're saying send the input on c in into the variable i, and then I'm going to print out that you entered, and then I, and just little tricks that you may want to know for your own code.

I have these little trailing spaces before the double code ends, so that they'll be a space in the output when it comes out.

And then I end, there's my punctuation, and then I say, enter another number.

And then not surprisingly, we go cin into j, and then I have the ifs that I told you about.

Now, there are a number of parts to an if and they're not optional.

The most important thing trips people up, you have to have these round brackets, okay? The conditions that are used in if, the brackets aren't optional, so this says if i is less than j.

And then, we have a begin brace and an end brace.

Now, you've only seen these before in this sort of magic incantation int main at the beginning and a brace, and then at the end, returns 0 on a brace.

We use these braces throughout C++ to indicate a beginning and an end.

These are wrapping up the something that we should do if the condition is met.

There's only one line in here, I always use braces, they're technically optional if there's only one line to be executed when it's true but one of the most important best practices that you can adopt is to always use them, even for single lines like this.

What if I just decided to split this across two or three lines.

But I'd have to go add braces, that's nuts so you just have them from the beginning.

So what do I do if i is less than j? I print out the first number and then I remind you what that is, is less than the second number, and then I remind you what it is.

And then I have this else, else the first number is not less than the second number.

Really? Well, you know, it's a simple demo, but not less that, it could be greater than could be equal to.

So I'm going to go on with some more ifs and say well if i is equal to j, then I'll put out that it's equal.

And if i is greater than j, I know the suspense is killing you, I'm going to put out that it's greater than.

Okay.

Let's build this.

And I have a command prompt here that I can run it in.

And let's say three, and four.

The first number three is less than the second number four.

Excellent.

I'll press up arrow to run it again.

And let's just flip around.

Four and three.

You get two lines of output this time, because the else, in here it's happening, so it says the first number four is not less than the second number three, and as well this if came up true.

And so it prints out the first number four is greater than the second number three.

And just for the sake of completeness let's run it one more time.

And we get the first number four is not less than, that's from something else, and the first number four is equal to and that's from this block right here.

Let me show you a mistake that people make which is to only use on equal sign in here.

No errors, no warnings, when I run it, let's use two and seven.

Well, what just happened here? The first number two is less than a second, number seven, that's great, then it goes to first number seven is equal to the second number seven, what? Yeah, i changed.

Remember I said you don't always get what you want, you get what you say.

This line says change the value of i to be the value of j.

Now if that worked, then print this out.

And it does, it prints out the new value of I which is now seven.

There are ways to get the compiler to warn you about this, but as a beginner the most important thing you can do is just remember every time you want to do a comparison use equal, equals.

Is equal to, that's the comparison operator with two equal signs that you want to use every time.

The one with only one equal sign is set this equal to and that's not what you want.

Now, run this app a few times, and you can maybe imagine that if it was doing something slightly more exciting that having to run it over and over again, to do it over and over again, might not be your first choice.

Maybe you would like to have it run repeatedly.

We could put a while loop in our program.

Go up here, while something, brace bracket, go all the way down to here to the very end of everything and end the brace bracket.

And one of the nice things that Visual Studio will do for me is if I select all these lines.

And press Tab, it will indent them a little so I don't get so lost.

What am I going to go round and round? What's going to be my condition that I'm going to keep going as long as this condition is true? One of the kind of classic things to do in an application like this is to ask the user.

Now if they want to keep going or not.

So I'm going to declare another variable, and introduce you to another variable type which is the boolean type.

Boolean values can hold either true or false.

And you notice that Visual Studio turns the word true blue.

It's special, it's a key word in the language, now I can say while keep going is true, we'll do this whole loop.

Whenever you write a loop like this, you run the risk of writing an infinite loop, we have to put something in the loop that will let us get out.

So let's plan to ask them, yes or no, 0 or 1, do you want to keep going.

That's for me to keep the answer in.

Down here, after we've given them the exciting verdict about being greater than or less than or whatever, let's ask them.

And then we'll see in, into the answer.

And if, the answer is equal to 0, then we shouldn't keep going anymore.

And we say keep going.

Equals false.

If you're following along with me in Visual Studio, and typing for yourself.

You may notice occasionally, things are popping up while I'm typing.

That's called IntelliSense.

It offers to finish your typing for you.

And if you want to accept what it's offering you, you just press Tab, and that's how I got, keep going so quickly, once I got a few characters into it, Visual Studio knew what I wanted and offered it to me.

If the answer's equal to 0, keepgoing equals false, otherwise, we'll leave it alone as true.

Let's see what happens.

We'll build it, with Ctrl+Shift+B.

Come over here and run it.

Enter a number, four and three.

Four is not less than three, four is greater than three, that's fantastic.

Compare another? 0 for no.

I'll say four.

Oh, we went around again, right, because four is not 0.

And we only tested for being equal to 0.

If it's anything else it keeps on going.

Let's do six and seven.

First number's less than second number.

Good.

Let's try another one.

Just to prove I can use a negative number here.

Enter a number.

Great.

Let's do seven and seven.

It's not less than.

In fact, it's equal to.

You want to compare another.

I'm going to say no.

And we exit.

There you go.

We've got code that uses an if, that uses an else, and that uses a while.

Not that I have the slightest bit of justification for it, but I felt I should show you a for as well.

So I'm going to show you a for loop.

For loops are excellent when you know in advance how many times you want to go through something.

And I'm going to just go through this ten times for no particular reason.

The for syntax is quite particular, and then on top of that, C++ as a language has a sort of an idiom.

We tend not to loop from 1 to 10.

We tend to loop from 0 to 9.

Sometimes that's just for historical reasons, but other times it's because when we index into things, when we say I'd like.

Item number three in that collection over there.

And I know I haven't shown you collections, but imagine.

You have this idea of being able to have a bunch of things.

I'd like item number three.

We start counting at 0.

So, when we say I'd like item number 0, that's the first one.

When I say I'd like item number one, that's the second one and so on.

And as a result, it makes more sense to run our loops 0 to 9 instead of 1 to 10.

It's just kind of what we do.

So the three parts to a for loop look like this.

Say for, that's the keyword.

And the round bracket, which, like on the if, is not optional.

And then I can declare a variable with a type, so I'm going to declare a variable called loop, and initialize it.

For integer loop is equal to 0.

That's the first part the initialization.

Then comes the condition, which like the wild loop is the condition to keep going.

So I am going to say as long as the loop is less than 10.

Now it would work the same if I said less than or equal to 9, but it's just again an idiom or convention that we tend to go 0 to less than 10.

So 9's less than 10, 10 isn't, so we'll go from 0 to 9.

And then the third part of the for loop is what moves you on to the next step.

So in the while loop what moved us on was we asked the user, and we may be set keep going to false, or we left it alone at true.

In a for loop, very often what you do in the last bit is you increment, so we want to count from zero to nine, and we'll increment loop by one.

There are lots of ways you could do this.

For example, you could say Loop is equal to loop plus 1, that'll take the value of loop add 1 to it and put the result into loop.

And that's not wrong, it'll compile, but it's not how C++ people do it.

Because in C++ we have a ++ operator, which increments something by 1.

It's such a common thing to do, that it's built into an operator, and then I'll close my round bracket.

So, I have my three parts to my for loop and then in the braces, I have what it is that I want to do every time I go through the loop.

I'm just going to print out the number loop.

And then just so it reads nice, I'm going to put a space.

So we say four.

First part's initialization loop's going to start at 0.

Middle part, as long as loop's less than 10.

So we expect that to go zero, one, two, three and so one until nine.

10 will fail and will come out.

Loop plus plus so that will increment it up.

So the 0, one, two, three and what it will do each time through is print it out all on one line.

There's no ENDL's in here, and, with the spaces between them.

Let's let this run.

And I'm going to build it, and run it.

And you notice, because they are all one line, zero, one, two, three, four, five, six, seven, eight, nine.

And then we go, Enter Number.

Probably could have had an e on down before that.

I'm not going to enter another number again, I'm going to show you something that's a good thing to know if you're going to write loops and you're going to write console apps.

If you mess up and you get in an infinite loop you need to know hold Ctrl and press C.

Breaks you out of the application makes it stop running.

It's Control Copy everywhere else, but, not in a console prompt, so it stops that application from running.

So if you accidentally write a while or a for loop that will never finish, say you forget to increment here in your for loop, or you forget to change the variable that you're using in the condition in your while loop, you really should know about control C And one more thing before I move on, because I, I need to make this while loop a little more C++-ish.

Keepgoing is a Boolean variable.

It's only possible values are true and false.

You know that in the condition of a for loop, in the condition of a while loop, and in the condition of an if statement You need an expression that results in true or false.

It's not necessary to compare keepgoing to true.

If keepgoing is true, the while will, will pass.

It can actually just do this.

That's way more C++ idiomatic.

And it's kind of easier to read.

While we should keep going, you know, we'll keep going.

So now you have a more C++ idiomatic version of this code.

We're going to be coming back to for and while and if and else, and to data types like int, double float and bool.

Throughout the course, but now you actually have the building blocks of a real application.
Exercise: Guess My Number

The first exercise in this module lets you use cout, and that was all.

You really need to write some code that declares some variables, puts some values in them, maybe has some ifs and some whiles, and I have a really simple exercise for you to try.

You know everything you need to know to write this.

I want you to write a guess my number game.

To be a really playable game, it would need get a random number, you know, get a number between one and 10 or one and 100 or something, and you don't know how to do that yet.

There's a library, but you don't know it yet.

You know, put the answer right in your code.

So, say int answer equals 7.

Then build it.

You know, go in and change the code to like three.

And run it again and notice that it will behave correctly until you guess three.

The structure of the program would look like this.

Ask the user to enter a guess, and then let them know your guess is too high, your guess is too low, your guess is correct.

Using if statements, and then keep going till they get it, meaning you're going to want a while loop, kind of like the get going loop that we had in the demo you just saw.

Except, now your condition isn't going to be that some keep going is true, but that they've got the answer correct.

For now, please don't try to do any kind of error checking like what if they enter letters instead of numbers, or what if they enter floating point numbers? Don't worry about that for now.

And when you're testing it, you know, just enter integers like two and six and relatively small numbers.

And that way, we don't have to deal with error checking yet.

But you know everything you need to know to do this exercise, and what I'd really like for you to do is to stop and go and do it.

You can use the flow of control demo that we just did, for examples of how to do the wild, how to do the if, how to declare boolean variables, how to declare integer variables.

How to print things on the screen, read things into variables there all there in that demo.

I put them together into a slightly different format and run it and make it work, and I want you to pause here and don't move on until you've got your code working or it's almost working, and you really need to see a solution so you can just tweak the one little thing that you need to tweak.

But write all of it, or as much of it as you possibly can before going any further, really.

Well, I hope you wrote a lot of code while you were paused.

I'm going to show you a solution.

Your solution might not be identical.

If it works, that's all that really matters.

It doesn't matter what names we give our variables or even what order we do things in, only that they get done.

So, here's my version of this code.

I'm hard-coding the answer to seven.

And I'm declaring an integer to hold their guess and I'm using a boolean variable called not guessed.

They didn't get it right yet and at the beginning that value is true.

And while it's true we're going to go round and round asking them to guess, and then there's no other way out and then I guess Ctrl+C.

I prompt and ask them to guess.

Put their answer into guess.

If the guess is equal to the answer, yay.

And this is important, notguessed is now false.

And it's time for us to get out of the loop next time we come around.

If they're too high, or too low, I'm going to let them know that.

And we come down to this brace bracket at the bottom of the while.

Control's going to come back up here.

If they didn't guess it yet, we're going in and ask them to guess again.

And all that's left here at the bottom is the return 0 in that closed brace.

Let's just prove that it works.

I think it's four.

Oh, that's too low, okay.

Eight.

Oh, too high, okay.

Now I will try seven.

Yes.

And if we change seven to say three.

Build it.

Run it again, five, oh, that's too high.

Two oh, that's too low.

One, because I'm stupid and I went in the wrong direction, still too low.

Three, yeah, so out of these very simple little building blocks, comes an actual application.

It may not be the most compelling game play, if you're, in double digits of age.

But, it's a real game, and you could write it out of the pieces you've learned, just so far.
Summary

This module covered the real fundamentals you need to get started.

We talked a little about libraries, and specifically The Standard Library.

It gives you what you need so that you can read input from the keyboard or write things to the console that the user is looking at.

And the demos were already long enough, so I didn't repeat them on my Linux box or when my other compiler But of course they work the same there and you're welcome to do this on whatever tool set you want.

The Standard Library has a lot more in it besides streamline but that's our first point of entry into The Standard Library.

In C++ you keep information in variables and variables have a type and once a variable has a type that's its type.

And you cannot say oh, you know that number I was using before, I'd like to think of that as a date now.

That's really not happening in a strongly type language like C++.

As well all the expressions, 2 plus 2, 7 divided by 2, and so on also have a type.

Which is figured out by the compiler according to rules.

For example, if all of the numbers involved in a calculation are integers, the answer is an integer.

Even if things don't divide evenly, that's just how it is.

And if you'd like it not be an integer, you need to make sure one of the numbers in the expression isn't an integer.

In fact, there are a number of rules about the type system about when you would lose data, when you would gain precision, and some things give you warnings, and some things give you runtime errors, and it's important for you to respond to those warnings, and fix your code when you see those warnings and not just carry on, possibly losing data or having other problems.

In addition to the types that are built in, and you've met double and float and INT and bool, there are other types, an infinite number of types, that don't come with a language.

They might come with a library, or you personally might write them.

And that's one of the huge powers that C++ brings, is writing your own types and defining everything about how those types behave.

Also in this module you met the keywords if, else, while, and for, and they control the ordering which things execute.

So something might get skipped over, if it doesn't meet the conditions of an if something might get skipped over if it's in and else, and it did meet the conditions of the if.

Or something might get run over and over again if it's inside a while or a for.

I didn't spend the time, time on the syntax for these.

You're welcome to pause and look closely at them, but, because you'll be seeing them over and over and over again, every application is built out of these building blocks.

And even with such a small collection of keywords as we've covered so far, some types, some simple operators to use in your if statements, and those four flow of control keywords, you can build a real application.
Functions and Headers
Introduction

Hi.

Welcome back to learn how to program with C++.

My name is Kate Gregory and I'm introducing you to programming using C++.

Earlier, you saw how to send information to the screen using Stream Aisle.

And you were using functionality from a library.

Some of that capability is provided as functions.

And in this module, you'll see how to write your own functions and to call them.

You'll also see how to make sure the compiler and the linker pull everything together properly.

As part of that, I'll introduce you to a very popular convention in C++.

The language doesn't demand it, but we all tend to use it, known as header files, and including header file.

By the time you finish this module, you will understand some of the things that you saw in previous modules with this little starter, do nothing application and with some of the changes that we've made to that application since but I didn't fully explain.
Functions

A function in C++ is a bit of code that you would like to use repeatedly.

You give it a name and you make it possible for other code to call it.

Now before that code can call the function, it has to declare it.

All functions in C++ have a return type.

They don't just return whatever they feel like, or different types depending on when they're called.

The compiler has to know, this is a function, if I call it, it will give me back an integer.

This is a function, if I call it, it will give me back a bool, a true or false.

Part of declaring it to the compiler is telling it just that before you go to use it.

A function can encapsulate any kind of work that you need to get done.

If you need to calculate somebody's age.

What would you calculate it based on? Well on their birthdate.

So, you could write a function called age that takes somebody's birth date and figures out how old they are.

So, what it would return would be an integer or perhaps a double or floating point number, of the number of years old they are.

That ideas that it takes their birth date in order to figure out their age, is the parameter to the function.

A function can take any number of parameters including zero.

And each of those parameters have a type.

And they also have a name.

And the code that implements the function will talk to the parameters using that name.

The type of the parameters matter because when you call a function, the compiler will enforce some rules around the type.

If it's expecting an integer and you give it something that's not an integer, the compiler's going to react in the same sorts of ways that you saw it reacting when we were using the equals to assign values into variables.

So here's an example of the implementation of a function.

This is the first line, it's not complete at this point.

This says, I have a function called add, and its return type is int.

Just as when we were declaring variables, the return type came before the variable name.

When you're declaring a function, the return type comes before the function name.

And then the round brackets say, this is the parameters that the function takes.

And this particular function is called add.

And it takes two parameters, they're separated by commas.

It takes an int called x and an int called y.

They don't have to be called x and y where you use the function.

But that's what we're going to call them as we carry on to implement the rest of the function.

And we have an open brace bracket, which as you know, represents sort of the beginning of something in C++.

And the entire body of the function is just one line long it's a return statement, x plus y.

It doesn't have to be one line long.

It could be a thousand lines long although that would be kind of bad style.

It can declare a local variables, everything you've seen in main, you can have in a function.

But I chose to write a really small and simple one that we could understand at a glance what it does.

The return statement is what actually calculates the return value from the function.

Since x and y are both integers, x plus y is an integer this function will return an integer.

And after the return statement I have a closed brace to indicate, okay I'm all done telling you about the definition of that function now.

And then somewhere else in my code, I can call the function like this.

I'm doing this all on one line, but I wouldn't have to do it all on one line, I could have an integer a kicking around already.

A is equal to add at 3, 4.

That's going to pass the two values 3 and 4 to the function add.

And then, when that function executes, x will be 3, y will be 4 and the one line of the function's going to run x plus y will be 3 plus 4 which will be 7.

And this function will return 7.

And back in the calling code, a will get the value 7.

That's really what it means to call a function or to use a function.
Demo: Functions

I've taken the little starter, simple program we've been using throughout the course, cleared out all the old code I had in the main and added these two lines.

And then before the main, I've included this definition of the add function, just as you saw on the slide.

So here I'm calling the function and putting the results into a, and here I'm printing an out as we did before.

Perhaps it occurs to you when you look at this line of code to wonder if we even needed a.

Could I just put add at 3, 4 right here where a is? Absolutely you could.

This could be just one real line of code.

Now, before I run this, I want to make a little disclaimer.

This isn't a useful function, and I'm not currently showing you a best practice.

Functions are most useful when you need to call them repeatedly.

You don't want to keep having the same 10 or 20 lines of code recurring in your application.

Or, when they give a name to 10 or 20 lines of code that help other people to understand what you're doing.

So you say first I will calculate the total price of the order.

Then I will calculate the shipping on the order.

Then I will calculate sales tax on the order.

Then I will mark the order as shipped or whatever.

And using names for functions helps people to understand what your code is doing.

Here, being just one line long, I could have just used the plus sign back in the place I was doing the calling.

So I want you to kind of suspend disbelief for a moment.

And pretend that this function actually does something useful.

So if I build it.

You see what, I hope, is the familiar output pattern.

One line is saying it's compiling small, that's CPP.

And one line in the linker saying that it's made Small.

exe.

I have a command prompt open here.

And if I run small, it says 3 plus 4 is 7.

And I really hope that doesn't surprise anybody that the add function works and give this a value of 7.

Let's use the function again and this time what I would like to do is add some numbers that are not integers.

I'll just copy these two lines with Ctrl+C.

And then paste them with Ctrl+V.

I'm going to set up slightly more complicated calculation.

I'm going to add two doubles 1.

2 and 3.

4 and I'm hoping to put the answer into a double called b.

Just fix up my print out.

And whenever you copy and paste you've got to make sure that you change all of it.

We need to print out b not a.

And so that these don't smush together into the same line We'll put an end line between them.

So if we build it we have an extra line of output and that is warning, argument conversion from double to int.

Argument is a very particular word to a compiler it means what you are passing down to a function.

I'm passing doubles to this function.

But they will be converted to integers.

And in fact if I ignore the warning and run it.

You know this isn't true.

One point two plus three point four should be four point six right? It's printing out four.

The reason is that 1.

2 is converted to an integer and becomes one.

3.

4 is converted to an integer and becomes 3.

So inside this function we are being asked to take one and three and add them together which we do giving the answer 4 which is what comes out on the output.

There was a warning.

We were warned.

You are passing doubles to a function that expects an integer.

Just as when you were using the equal sign, taking a double and to an integer generates a warning.

But there's no warning in the other direction.

The result that comes back from add is an int and putting it into a double doesn't give you a warning Always okay.

Remember to promote things.

Remember, you get what you say, not what you want, and you mustn't ignore warnings.

Well, what good is add if it won't add doubles or floating point numbers, if it will only add integers.

What should we do about it? You have a number of options.

But the safest one is to simply change this to a function that works with doubles.

It will be perfectly happy to get integers when it was expecting doubles.

And your answer will be correct.

So let's fix that.

And build it.

Now we have a warning in the other direction.

Conversion from double to int possible loss of data.

And that's happening here on line 12.

And I'll double click the warning to go to that line.

Add now returns a double.

Taking that and putting that into an integer is triggering a warning.

And because you know how add works, you know that it's going to give back an answer of 7, and it's perfectly safe to put 7 into an integer.

But the compiler doesn't know that.

Maybe our function averages them, or takes their square root of something.

It could do anything.

All it knows is you said this function returns a double, and now you're trying to put the answer into an integer.

This value of A.

All we're going to do with it is pump it out on our output statement.

So we don't really need to explicitly care if it's an integer or a double or not.

So I could fix this warning plenty of ways.

One was could be I'll just declare A to be a double.

But another way that I kind of like is to use auto.

Remember, auto says whatever value it is you're about to put into this variable, that's the type I'd like you to use.

And the cool thing about using auto in this case is that anytime someone changes the return of this function It'll naturally change the type of a.

That could be a bug.

If you don't want the type of a to ever be anything other than an integer, and you want the compiler warning you.

Hey, that function you're calling returns doubles now! Then don't use auto.

But in this particular case where.

We're only using it to hold the value.

I think it's a great use of the auto keyword.

Let's compile and confirm that everything now works.

Sure enough, no warnings.

And if we run it, 1.

2 plus 3.

4 is 4.

6, so now you're getting the answer you expect.

And that's how to write function, use function more than once even, and confirm that it's operating the way you expect.
Type Safety

C++ is a type safe type language, and it's a strongly typed language whenever you call a function, all of the rules of type safety kick in.

When you call a function, you provide values that are going to be passed down to the function.

We call those the arguments.

When the function executes, those values will be put into the parameters inside the function.

If the values you provide are not the same types as the types of parameters the function takes, then there may have to be a type conversion.

The function takes an integer you're giving it a double, that's a type conversion.

The other way around too, if the function takes a double and you're giving it an integer that's also a type conversion.

And just as with the equals sign the compiler warns you when you demote things.

When you cast downwards and possibly throw data away.

So taking a double and converting it to an integer will get you a warning.

And it doesn't warn you when you promote.

You integer and give it to something expecting a double.

If you ignore the warning, the application will run, but you may not get the results you expect in terms of numerical values.

Exactly the same thing applies with the return value from the function.

It has a type, if the function returns an integer, and you want to put it into a double, that's fine, that's promoting, no warning, But if the function returns a double and you want to put it into an integer, then you will get a warning, the same as if you were assigning any other double value into an integer.
Overloads

I've shown you an application with one function in it.

Real applications have many more functions than that.

Sometimes, you want to write a number of functions that are similar but not identical.

For example, we wrote a function to add two numbers What if we wanted to add three numbers? How could you handle that? Perhaps you could say, I'll write a function called add three.

That takes a, b, and c.

And some doubles that we're going to add together.

And then you would probably feel like it'd be a good idea to go back and change add, and to add two to make it clearer that it can just add two numbers.

And then maybe later you can write add four, and add five.

Or what if you wanted to add things that weren't numbers? Like taking a date and adding a number to it or I don't know what.

You get these long complicated names where most of the name is taken up describing the parameters the function takes.

This is completely unnecessary in C++.

You are allowed to have two functions called ad.

You don't need to.

Put something into the name to help you tell them apart or just to artificially distinguish two add functions, one from the other.

The compiler needs to be able to tell the two functions apart.

And then, we say that these are two overloads.

So, they have the same name.

And they should do, really, the same thing.

But they take different parameters.

Taking a different number of arguments, so having an add that takes two doubles, and another add that takes three doubles, that is the best way to tell overloads apart.

You're choosing the best name in both cases even if it's the same name.

The compiler can tell them apart.

Now people sometimes want to write two functions with the same name.

but take exactly the same arguments, but that return different types.

One returns an integer, let's say, and one returns a bool true or false? This is simply impossible.

I don't mean it's a bad idea.

I mean you can't do it.

The compiler will say, "Hey you already declared a function that takes an integer.

You can't declare another function with the same name that takes an integer, even though it returns a different type.

I won't allow it.

Only what the function takes as parameters can be used to distinguish overloads.

Now it is in theory possible to write two functions with the same name.

I take the same number of arguments, but those arguments are different types, like ones take a bool and one takes an int.

I would not call it a beginner technique and I'm going to show you in a demo, how good overloads work, and then how overloads can be scary.
Demo: Overloads

I've added another function int to small This function is also called add, and you can see that it takes three parameters.

I happen to use x and y here, and a, b and c here.

I'm under no obligation to use consistent parameter names.

And, this a which is referred to down here.

Has nothing to do with this a.

It's simply a coincidence.

Like two kids in different families are both called Ashley, but they're not the same person just because they both happen to be called Ashley.

In fact, we say that this a and this a are in different scope.

And scope is a word that's really important in C++.

It's not the last time you're going to hear that.

Not by a longshot.

For now it's enough to know, even though they're both a, they're not related to each other at all.

I've implemented add, very simply.

Super easy to do.

If add was really a complicated function it might be appropriate to implement the three parameter version using the two parameter version.

Calling it, sometimes I'll also see things where if you call the two parameter version the implementation is a call to the three parameter one with the last or the first or the second or some parameter, hard coded.

To 1 or 0.

Those kinds of attempts to be more efficient, to not repeat yourself, to not repeat yourself, to not write the same code over and over again are really a hallmark of programming in C++.

You don't have to start doing that from the get go, but very soon into your programming practice, you're going to start Realizing oh I could just call that other function that I already wrote.

Yeah that be quicker and then if I change the other function the change will be made for me automatically.

I'm totally doing it that way.

However I have kept things simple here since this is totally a fake function by just using the plus and adding all three numbers up.

Let me prove that this builds.

No warnings, no errors, and I have some code down here to call it so this is adding three numbers, 1.

1 2.

2 and 3.

3 The compiler is perfectly happy with there being two adds.

And it knows which one to call.

It'll call the first one that takes two parameters on these lines and the one that takes three parameters on these lines.

Over in my command prompt, if I now run it, see that we get this extra line of output correctly pointing out that 1.

1 plus 2.

2 plus 3.

3 is 6.

6.

And so, as simple as that you're doing overloading.

You have two functions with the same name to take a different number of parameters.

I told you before it's completely impossible to overload based on return types.

The reason why is that the person who calls your function doesn't have to use the return value.

So if I say int an equal add at three.

comma, four or you could suggest ooh, she's trying to call the add that returns an int if there was one.

But this is legal, This function doesn't have any side effects.

It doesn't print anything on the screen or write anything to a file or do anything, other than calculate a value, which will just be thrown away.

But there's nothing wrong with it.

So if I build, there's no warning, there's no errors.

We just linked into our executables.

That's why it's impossible to overload on return type, because a perfectly valid program can pay no attention to the return from a function, if it's not interested.

You might think, why would you call a function? That does something and gives you back an answer and you ignore it? Well, some functions.

The answer they give you, people don't really care about very much.

For example, before the c out and the stream io that we use in C++, there was an older capability that came from C called print f.

Formatted printing, and that function returns how many characters it printed out, which most people couldn't care less about, and so they didn't put the return value into a variable or use it in any way.

And you don't have to, if you don't want to.

I want to show you a little exercise of what I told you about overloading on the type of the argument.

Here are two new functions.

They're both called test.

One takes a bool, and one takes a double, a number, in other words.

And they both return a bool.

You can imagine you might have a situation where you're testing a number of different values that were all of different types, but you wanted to write your code very cleanly and have it always just test.

And it would call a different version of test depending on the type you wanted to test.

So how do you test a true or false value? Well you, that's not hard just return the value.

If you're given true return true.

If you're given false return false.

And in this strange universe we're going to test numbers by just seeing if they're positive.

And you can imagine there'd be a way to test a date and a way to test a string and a way to test any kind of information that we were given.

We'll just stop with those two.

And if I come down here to the bottom, and put in some code to use it, I'm going to test true, and then I'm going to test a double that's positive.

I'm expecting both of these functions to pass and to print out this information.

So let's compile it.

No warnings, no errors, everything's great.

It's perfectly fine to have two functions called test that each take one parameter.

They differ only by the type of that parameter.

This line where I'm passing true, true is a type bull so it'll call the bool version.

This one 3.

2, 3.

2 is a type double.

It'll call the double version.

l Let's run it.

And it says, true passes the test.

We're missing an end line in there, but that's okay, and 3.

2 passes the test.

Fantastic! So, why did I say overloading based on type was risky? This looks fantastic.

We're getting exactly the behavior you want.

Let me copy these lines.

And try an integer.

Three.

We'll build it.

Oh, we get the error list, not just the output here.

Ambiguous call to overloaded function.

If you look in the output it's also got quite a bit of a complaint here.

Ambiguous call to overload a function could be bool tested double or bool tested bool.

Now to we humans this is insane.

We have one version of the function that takes a number and one version of the number that takes true or false.

And I want to call the function that I'm passing in a number.

Now we said before that you know, the compiler doesn't mind promoting integers up to doubles so, what's the problem just call the double version right? The compiler doesn't think like you and me.

It knows how to convert and int into a double it's true.

It also knows how to convert an int to a bool.

And It's kind of paralyzed there.

It says, I don't know what to do.

This is ambiguous.

Help me.

Now, you can help it.

I could write another version of test that takes an integer.

I could make this 3.

0 instead of 3.

If this was a variable that was of type int, there's a way to say, it's okay.

Trust me.

Think of this as a double.

I'm not going to show you how to fix that, I really only wanted to show you the problem.

When you overload two overloads of the same function they take the same number of arguments and differ only by type, you take on a burden of how people are going to use your functions.

Especially if you're part of a team and you're going to write the function and other people are going to call it.

It may not be as simple and straightforward as it was before you wrote those overloads.

If your overloads always vary by the number of arguments, you're safe.

You don't need to worry about ambiguity in the way that the compiler might convert types back and forth.

The minute your overloads differ only on type, suddenly you need to know a lot about type.

And my memory of being a beginner I didn't know a lot about type.

I didn't necessarily know what could convert back and forth from one to another and which were promotions and which would cause warnings.

So for beginners I think it's pretty good advice.

Don't overload on type only.

Your overload should be on number of arguments that's safer.

Before I move on from functions entirely and start talking about header files, I want to come back to these lines where I paid no attention to the return type.

You might be wondering, does a function have to have a return type? And the answer is both yes and no.

Sometimes you want a procedure to happen, you don't really need the value back from it at all.

There isn't even any meaningful value back from it.

In some other programming languages they have the concept of a sub-routine.

Go do these ten lines then come back here, and there's no return for that.

And C++ supports that with a special weird return type called void.

So I could write a function, let's write another version of test, And a void function doesn't have a return statement in it if it doesn't want to or if it does, it's just the word return because you don't return a value.

C++ doesn't have a special name for a function that don't return a value, but it does have this special keyword; void, which means nothing.

If I leave it off, I'll get a compiler error, you have to have a return type.

So void Is the special trick that means actually I don't return anything.

You don't have to take arguments if you don't want to.

I can make a version of test that took nothing.

And sometimes you'll see especially older programmers.

They'll put void in here too to say, it's not that I forgot, it's that it actually doesn't take any parameters.

However, there's no need to do that.

And I think it looks cleaner like this.

I'm going to build just to prove to you that it will build.

There you go.

It builds.

And this is how you have a function that doesn't return a value.
Multiple Files

So far, my demos have only really had one file, small.

cpp.

We've compiled that file into Visual Studio as part of a Visual Studio Project inside of Visual Studio solution, and there have been all these other files that Visual Studio added for options and settings and things, that we've ignored, and we've also compiled that single file with the GCC compile.

And there's no reason why you can't build.

Know the software to control a nuclear reactor or to calculate everybody's insurance payments or to run a giant multinational bank in one giant CP file, but there are very good reasons why nobody does.

Imagine a 10, 000 or 100, 000 or million line file of code, and you need to find the one little thing you change, and then you need to compile all of that.

I've worked on plenty of projects that a full build takes hours even overnight, minimizing compile time is pretty important in a project like that.

And of course, if you have multiple developers working on a project, one of the usual paradigms is that you each check out the file you're working on And then check it in when you're finished.

If you're always working on the same file, you're going to have to resolve potentially conflicting changes every time.

So while your file can be one giant single file, the reality is we build real C++ applications, games, business applications, servers, you name it, out of multiple files.

In order to build that project, you need to first compile each file.

Into an object.

And then link all of the objects together.

Which actually makes the linker, you know, sound more useful than it was when we only had one file.

Why do you compile and then link as two separate steps when it's only one file? Well because that's just a really special edge case, normally it's lots of files and you compile each file and then you link all of the object files together.

Different tools handle this in different ways and I'll show you the Visual Studio way and the JCC way.

One last point, when you take functionality and move it into another file, it will get connected in place by the linker at the end of the build process.

But you must keep the compiler happy by telling it, that you have some functionality implemented in another file that you intend to use.
Demo: Multiple Files

In Visual Studio.

The way you instruct the system to compile multiple files and link all of their output together is by putting the files into the same project.

So I'm going to add a file to the small project.

And I'll right click.

Add new item C++ file.

And I'm going to give it the name functions.

This is actually not a very descriptive or useful name.

I'm choosing that because that's where I'm going to move the functions off to.

If I hadn't written such blatantly fake things, You can imagine I might have a file for the add related functionality.

Or even all of the arithmetic related functionality.

And another one for the testing.

And so on.

For now, I'll just call it functions.

And I'm going to take all of these implementations of the functions And copy them in here.

So this is now nothing but a file of functions.

The reason I didn't cut them out is that, in order to call these functions in main, we have to tell the compiler that These functions exist and are callable.

In fact, I'll just demonstrate that to you by temporarily deleting them all.

And building with control shift b.

Tons and tons of what's ad what's test, I don't know what's going on and then because I used auto to declare some of the variables, that type depends on the return of ad but it doesn't know what ad is so things just get worse and worse.

So let me put them back.

I'll just undo the deletion and show you how you declare a function to the compiler without implementing it.

Simply add a semicolon here and take away the body.

I'm going to do that for each function in turn.

And I'll just neaten them up a little.

What these lines now say is there is a function called add that takes a double and returns a double.

There is a function called add that takes three doubles and returns a double.

There is a function called test that takes a bool and returns a bool, a function called test that takes a double and returns a bool, and a function called test that doesn't take anything and doesn't return anything.

I don't have to implement these functions here, but I need to tell the compiler that these functions exist, and now when I build See that small was built without any errors.

You don't see any mention of function being built in this output.

And that's because Visual Studio only builds the files that have changed.

It just makes your compile quicker.

And functions built successfully last time.

I'm going to use the rebuild menu command to make it build everything, so that you can see the steps.

Compile small, it compiles functions, and then it links them together into the EXC.

Let's run it to make sure that it still works as it did before.

And it does.

3 + 4 is 7, 1.

2 + 3.

4 is 4.

6 and so on.

All of my functions, my add and my test functions are being found.

And called successfully, because the implementation in Functions.

cpp was linked with the calling code in Small.

cpp.

Visual Studio knows that it needs to compile both of these, because of something called the project file.

And you know when we were using GCC, there isn't a project file.

However, I just need to get a slightly longer command, to compile both files together.

If you've been following along in GCC all along, or if you just remember from the earlier module, we would say, gcc and then the name of the file, like small.

cpp, and functions.

cpp those of you who aren't Familiar and comfortable in a command prompt.

I'm pressing tab to finish typing out the rest of the file name for me.

When I do this I get a zillion errors.

And the first time this happened to me I was really confused.

I kept looking at my code and looking at something else again.

And, and I couldn't figure it out other than I could tell they were all linker errors, but I couldn't figure out why.

The reason is, there are two compile and link commands provided to you with GCC.

And the one that's just GCC is actually the C linker, and it's perfectly willing to compile C++ code.

It's able to detect that it's C++ code and do the right thing, but it doesn't link properly.

So to get the behavior you want, you have to start using G++.

Small and functions.

Now we get silence.

And you may remember that silence is always a good thing.

It means that everything worked and there were no errors.

So there's nothing wrong with that code.

Just that if you use the wrong tool to try to compile and link it, you'll get errors.

Everything's fine using the G++ tool.

And as soon as you switch to multiple files, you need to use G++ every time.

As before, it creates an executable called a, and the output from this is identical, even down to not having the end line when we should, as it was from the Visual Studio executable.

Nothing's changed in that.

As I've said repeatedly.

I'm going to show you completely standards-compliant C++ that you can use in Any compiler on any platform.

And if it wouldn't make everything take too long, I would also fire up my Linux box and do this in Clang, and you would see the same thing, compile and link the files together.
Header Files

In the demo that you just saw, I had to declare all of the functions, the different overloads of add, the different overloads of test before I used them in main.

Consider a situation where I have dozens of files in my project, and they're using all different kinds of functions that are implemented in other files in the project.

If every file starts with 5, or 10 or fifty lines declaring all the functions that it's using, that's really not a good situation.

Imagine that I need to change add, as I did earlier in this module, from taking two ints and returning an int, to taking two doubles and returning a double.

And that I only came across the need to do that after I declared add in ten or twenty different files in my project.

One of the most frustrating bugs in the world is when you need to make the same change, in let's say twelve different places, and you accidentally only make it in eleven places.

That's a bug that's so hard to find, because you keep saying to yourself, well I know I changed that.

That maintenance challenge of having nearly identical code in file after file is very real.

And even in our little demo, starting out with a list of here's some functions I might be calling later, pushes the kind of good stuff down the screen, you can't see it as well.

So the solution to both of those is just to take those declarations and put them in a separate file.

And then bring that file, include it into the C++ file as you are compiling it.

And that directive in C plus plus is called the include directive.

In fact, anything that starts with that number sign, pound sign, hash sign, as you feel like calling it, is actually an instruction to a step that runs before the compiler, called the preprocessor.

And it will just literally glue the contents of that file into your C plus plus file, and then hand the whole thing to the compiler.

When you use include file properly, your code's neater and understandable, and of course, more maintainable.
Demo: Header Files

I'm going to add another file to the project in Visual Studio.

Add new item.

This time I'll choose a C++ Header File, and I'll call it Functions.

The compiler will allow you to give this Header File any name you like in the universe.

But since I'm going to be declaring all of the functions that are implemented in this.

C++ file, it would be really strange if this was called functions, and this was called useful stuff.

By giving them the same name, we are telling people to expect that what's in this header file is the declaration of all of the functions in this cpp file.

And I have those declarations right here.

I just cut these out.

Put them in here.

And then in here I'll include that one.

Now just for convention, the compiler doesn't like it but I like it.

I'm going to move this using statement.

Down here.

Because of using name space, Statement changes the interpretation of some of the things down below, I like to put it right obviously before main and not mushed in with a big block, because I could be including 10 or 20 things here and you might not spot that using Statement.

I'm going to take a moment and prove to you that what I've just done still works, still composites, still runs.

And then I want to come back and look at this code again and talk about it.

First, we'll build with control shift b.

You can see we only needed to compile small since I didn't change functions and that we've successfully built the executable.

Which I could run.

Still runs exactly the same as it did before and if I go over to my other command prompt for mimgw and use the G++ command to compile and link them both again.

Silence is golden, if I run a again, I get my same output again.

Simply moving the declaration of all those functions into functions.

h didn't really change anything about the way small.

cpp compiles, because all the preprocessor does when it meets this line is it pastes the entire contents of the file Right there, so it's hardly surprising, since that's what used to be there, that everything still works as before.

But now this is so much more readable.

Now you spot main right away.

And I want to take a minute and kind of pull back, because we've been very focused on, here's how to make stuff work, and not so much on here's what things mean I showed you the basic structure of main a million years ago.

It starts int main () { and it ends return 0:}.

Now you see main is just a function.

It's a function, just like add or test or any of the other functions that we could possibly write.

It has a special role to play, because when you run an executable, the operating system looks for a function with that name.

At least for your console application.

And calls it.

And that's how your program runs.

But other than that, it's exactly like any other function.

And so small.

CPP happens to declare just this one function home main.

Whereas functions.

CPP implements all kinds of functions.

None of which are called main.

But there's really no important difference other than that magic name between this file as a collection of functions and this file as a collection of functions.

We have two include statements now.

This one brings in iostream from the standard library to let us use the c out object and this insertion operator to put information on the screen for people.

This one is a header file we wrote ourselves.

And you'll notice they have different punctuation around them.

Iostream has angle bracket and functions has double quotes.

That's very deliberate.

The pre-processor will actually look in a different location for the headers based on the punctuation that you have put around them.

If you just say quote iostream or angle bracket functions.

h, your file might not compile because the pre-processor might not find the header.

People sometimes ask why does my header file end with.

h when iostream doesn't end with anything? The compiler and the pre-processor, they don't care what you call your files.

I could call these.

header, or.

Kate, or no extension at all.

Giving them an extension because I'm working in Windows, helps the right things to happen when I double click them and it's a way of communicating other developers.

To have a convention it says.

We'll call all our C++ code implantation files.

cpp, and all our header files that we expect to include into other places.

h.

There are other communities with other conventions.

For example, hpp is a very popular name for a header file in a C++ application, because.

h was popular in C.

You had.

c and.

h.

So, some people like saying.

cpp and.

hpp.

You can imagine an operating system that's perfectly happy to have the plus symbol in a file name might use H++ and C++ as the extension.

And another operating system that doesn't really do extensions doesn't really care if you happen to have dots in your file name, but they don't mean anything, might not want anything at all.

Now imagine in that universe you're on the C++ standards community and you have to come up with a name for the header for something like iostream, which is going to be a standard and is going to be used everywhere.

Do you give your, kind of, blessing to.

h? To.

hpp? To.

h++? To no extension? Well they went with no extension.

The headers from the standard library don't have an extension on them they are just a name like iostream.

The headers you write yourself and include into your work will have an extension.

I am using.

h, Visual Studio when it creates the files for me gives them that extension so it's just convenient but you know I can rename them in Windows explorer any time I wanted to.

There's no special magic to the name being.

h it's just a convention that developers have adopted.

And I have to tell you at this point now, looking at this little piece of code in Visual Studio, there's no more magic incantations in it.

Everything in here you now get.

You know what the include directive does.

You know what the angle brackets mean on the iostream include directive, and what the double quotes mean on the functions include directive.

You know what all of the punctuation in int, main, open round bracket, closed round bracket, open brace, bunch of stuff.

Return zero semi colon, closed brace.

You know what all that means now.

Names just a function.

Iostream is just something preprocessor will glue into your file as its compiling your code and you can compile that code with the Visual Studio compiler and then it will end up getting linked, or with any other compiler you want and it will end up getting linked and you will always see as long as you write standard C++ the same.

Behavior.

Warnings for the same things, errors for the same things, and the same output error at runtime, because that's what it means to be a standardized language.
Errors and Mistakes

In order to successfully build your code, every file needs to be compiled, and then the resulting objects need to be linked together.

When you only had one file, if you got a compiler error, you knew which file it was in, and you knew which file to change to fix it.

And at the same time, if you got a linker error, you also knew where to fix it.

If you have three, or seven, or 500 files, and you get a compiler or a linker error, how will you know to go where to fix it? The two kinds of mistakes that a person makes when they are working on a multi file solution like this, are compiler problems and linker problems.

So you must declare a function before you call it, otherwise you'll get a compiler error.

The two ways to forget to declare a function, is that you don't include the header files.

So here I'm totally going to use those great functions in functions, cpp.

And you just run around calling them but you forgot to include functions.

h.

Or possibly you know all about funciton.

h and you include it, but it's missing one of the functions that's implemented in functions.

cpp.

Either way you'll get a compiler error saying, I don't know what you're talking about I've never heard of this function you're trying to call.

The other side of the coin is you make the compiler perfectly happy.

You tell it.

You promise it.

There's going to be a function called Add that takes 3 doubles.

It's the greatest ever.

And then you don't implement it.

So maybe you forget to actually write the code for it in that cpp file or maybe you forget to instruct the build system to compile that cpp file and then the linker needs to remember to include its output in all the objects that it links together.

So then you get a linker error.

It says, " Man somebody asked for this add function and, in good faith I'm ready now to go and find that add function and cause the linkages to happen so that main can call add and I can't find it, and that's when you get a linker error.

When I help beginners to C++, what I'll often see is though have a compiler error and they will be in the implementation file saying look, look I implemented it.

Well though I have a linker error and they will be in the header file saying look, look I declared it.

Well, that's nice, that's not what the complaint is.

You have to fix the complaint.

I'll show you in a demo.
Demo: Compiler and Linker Errors

Let's make some deliberate mistakes so that you can see the consequences of those mistakes and what errors they cause.

Then later when you make a mistake without knowing it, you'll recognize the error and go, I remember.

We'll start by going into functions.

h and forgetting, quote-unquote, to implement this add function.

So, I've commented it out.

The compiler ignores comments.

It, this is like the line isn't there.

Let's build.

And we get a number of errors.

Interestingly, because there's another overload available, the error is, hey, I know all about add.

It only takes two arguments.

What are you doing giving it three? It's a compiler error you can see c, c, c.

Any error that starts with c and then a bunch of numbers and visuals to you is a compiler error.

If you prefer to see it in the output window same thing.

Group of errors that all start with c and are complaining.

And we can double click this line and see You're objecting to being given three arguments to the add function because as far as the compiler knows, add takes precisely two.

Let's make that right.

And now, we'll go in here and we'll comment out the implementation of this function.

And we'll build.

And I want to actually show you the output first.

It compiled Small.

cpp.

Silence, it didn't have anything to say.

So, there were no compile errors.

It compiled Functions.

cpp.

Again silence.

No compile errors.

Generating code.

We're going to get the linker rolling and oh, linker error.

They start LNK.

C for compiler, LNK for linker.

It's easy when you know about it.

In other compilers the error codes may be different, but the same concept of telling you what the problem, who had the problem, is the key to you finding the problem.

So it's saying, unresolved external tells you, even hear the name of the problem add double, double, double.

Basically here, the compiler's complaining of a broken promise.

When you included that header.

It had a line in it that promised that somewhere, in all the source files that we're going to end up getting linked together, this function existed.

And now the linker has been through all of the different object files as a result of successfully compiling all of the source files, and it cannot find this function.

It's basically saying to you, you've broken your promise to me.

It told me I could find this function and now I can't.

I'm going to leave this function unimplemented so that we can show the linker errors for the G ++ tool.

It also is complaining and you have to know that.

o refers to an object file.

And that way you know that it is about the linker, but it also is saying undefined reference to add at double, double, double.

It says it a couple of times.

I go back into my code, undo that commenting out, and comment this one out again, Just, again, to give G++ a chance to show you the compiler errors.

Too many arguments to function double add at double double.

Auto C is equal to, here's the problem with the little arrow, and then is says, the reason I got this declaration was that it was included in functions.

h, like this, and it makes that complaint twice because we call add twice.

So the error messages may look a little different, but they are clearly compiler errors because they're complaining about.

cpp file.

Whereas the linker errors were complaining about a.

ol file.

And, you can then go and fix the appropriate problem.

You can pacify the compiler simply by promising it that the function exists.

But you're going to have to keep that promise with the linker.

Otherwise you're going to get a linker error.
Summary

If all there was to C plus plus was functions, you'd be pretty much good to go right now.

But of course, there is more.

However, by covering functions and header files, you actually understand The little do nothing main application, as well as the one that wrote on the screen, in their entirety.

There is no more secret, arcane, never mind what this means, you get all of that now.

Writing your own functions always beats having 1000, or 10, 000, or a million lines of code that just is.

It meets two important principles.

The first is don't repeat yourself.

So if there's ten, or 20, or a 100 lines of code that does something specific, and you're doing it over and over and over, you don't copy and paste those lines of code over and over.

You put them in a function and you call the function over and over.

Even if you don't call it over and over, putting 'it in a function and giving it a name lets your code be expressive.

It means you don't need so many comments.

If your code has 12 lines of code to calculate sales tax, and 15 lines of code to figure out someone's commission, then you've got 62 lines of code that someone has to explain.

But if you have a function called calculate sales tax that returns a number which is the sales tax and another function called calculate commission that returns a number that's the commission when I see those two lines of code that make those two calls to those well named functions I know what it does.

It's expressive.

This advantage of functions is true regardless of where in the various files you're working in those files are located.

But you make things better still if you move those implementations off into a separate.

cpp file.

Doing that for example can make your compilation process quicker.

As you have already seen in the visuals to do your builds, it only compiles files that have changed.

Then it links all of the object files together.

The ones just made and the ones that are hatched from before.

And that simply makes your build process quicker.

Haven't shown you how to do that with the other compilers yet, but they have that capability as well.

When you choose to implement things in two cpp files or a hundred, you have to make sure where you call things that you make that promise to the compiler.

There is a function like this that you'll be able to find and use.

We declare it to the compiler.

A handy way to declare lots of things is to put all the declarations in a header file, and just include the header file, and that is really the door opening of how you get to functionality you didn't write or that you wrote and you're keeping somewhere else.

Understanding the compile phase, the link phase, and the different kinds of errors that you get puts you in a great position to be able to fix compile errors and linker errors when you get them.

If you understand, that error means I forgot to write the function.

That error means I forgot to declare the function, then you won't go off staring at the place where you declared it and saying, I don't get it, I declared it.

Why is the linker mad? Well, the linker's mad because you didn't write it.

Alternatively, you won't sit there going, I'm so confused, I wrote it, I don't know why I'm getting a compiler error.

The compiler doesn't need you to write it, it does need you to tell the compiler that the function exists.

Understanding the mechanics takes away some of the swearing, black box, try it again now, aspects of making C++ code work and turns it into something that actually is logical and understandable and that you can do on your own.
Strings and Collections
Introduction

Hi, welcome back to learn how to program with C++.

My name is Kate Gregory, and I'm introducing you to programming using C++.

This module is where you start to understand classes.

You know an early name for C++ was C with classes.

In many ways, C++ built on that heritage of C, but added this incredibly powerful concept of classes.

And a class is a type like int or double that's defined by a programmer rather than the language committee.

Someone else decides what int does, but you decide what employee does or bank account.

And, as I've mentioned before, sometimes the programmer's, the library writer.

You use most libraries by using classes from them and you will write your own classes, too.

Two incredibly useful classes in the standard library are string and vector, which I'll show you in this module.
Objects and Classes

C++ is an objected oriented language.

That means you'll be working with objects when you are writing applications in C++.

And how does that jibe with a sentence like C++ apps are made of functions? Well in a way they are made of functions that declare local variables, some of which are built in types, like integers and some of which are your user defined types, objects.

And that function, let's say main, might call a variety of functions but also use the capabilities of those objects.

That's what makes a C++ application.

Class and object are linked concepts.

They go together.

A class is the definition of what it means to be an employee or a bank account.

For example, if you think about an integer, I can add two integers, multiply two integers, or divide one integer by another integer.

And then if you think about two dates, I can certainly subtract two dates, you know, what's May 3rd minus May 1st of the same year? I can take a date and add an integer to it.

What's May 7th plus 5? But I can't you know, multiply May 7th times June 14th.

That doesn't make any sense.

So, when you define a class, you say objects, which are instances of this class, here's what they'll be able to do.

And also because you're talking to the compiler, you'll also be saying, here's how much memory to set aside for them, and that kind of thing.

We say an object is an instance of a class, so if I were to come up with a class like date, May 1st, 1990, would be a date, would be an object, that's an instance of the date class.

December 3rd, 2017, another instance of the same date class.

If I made a class for bank accounts, my savings account and your savings account will be different objects, different instances of the same class.

Just as I with the value 3 and J with the value 4 are different integers, they both follow all the rules of being an integer.

When you write an object and you define an object, you don't just find the data that it holds, you also define, typically, functions that are inside the class.

The person who writes the class, writes the functions and when you create an instance of that class, you can use its functions.

These are called Member Functions.

I showed you a number of functions in earlier module that just took two integers and added them together or took a parameter and did a simple test on it that return true or false.

And those are sometimes called nonmember functions, to distinguish them from member functions, or free functions.

And in C++, you will see plenty of both.

There are other programming languages that don't have objects, they only have free functions, and there are other programming languages still that don't have free functions; every function has to be a member of something, and C++ is sometimes called a hybrid language, because it enables you to have both kinds of functions.
Strings

Almost every application you're going to write will work with strings, collections of characters.

They might be a word, or sentences with spaces and punctuation, might be someone's user ID and password, the name of product in a catalog, a URL.

Almost everything you try to do requires these strings of characters.

And C++ developers can use a class in the standard namespace that comes from the standard library, called string.

You might remember that in order to use the stream il, you needed to include il stream as a header.

Well you just need to include string as a header to be able to use the string class.

And because it's in the standard name space, you either say std colon colon string, or using namespace standard and then you can just refer to string.

It's got a ton of great capabilities.

If you have two different strings, you can compare them to see if they're the same or not.

You can combine the two of them together.

Various manipulations possible with strings and with groups of strings.

You might want to find out is the letter E anywhere in this string.

Or is the sequence a, b, c anywhere in this string.

Might want to go through and change any spaces to a different character.

All of that capability is there in the class as provided by the standard library.

It really makes it feel as though string is a built-in type like integer or double.

That's a very powerful aspect of C++, and one that I think you'll see in the demo.

By the way, if you ned to use unicode strings, the standard library provides wstring, the w is for wide, that will support unicode characters.

And everything I'm showing you working with string will also work with wstring.
Demo: Strings

Here's another variant on good old small.

I've added another include statement to include that string header with the angled brackets because it's a header from the standard library, not a header that I wrote.

I'm declaring a local variable of type string.

Just as we declared local variables of type int or double or float or bool.

And I'm going to use cout to put some text on the string, and then cin to put what that person types into that string variable.

And between them, the string class from the standard library and the class behind cin, cin is an object that's an instance of a class that knows how to do stream input, cout is an object that's an instance of a class, ostream, that knows how to do stream output.

Between them, istream and string know how to get this job done.

And what the person types on the keyboard will end up in the variable name just as numbers that people typed ended up in integers and doubles in a code you wrote before.

And then I'm going to declare another greeting.

And just as we might say int i is equal to j plus 2, I'm going to say greeting is equal to Hello plus name.

And you can see that's going to put the two strings together.

I'm going to compare name to my own and tack on a special little bit of extra information on to greeting if it's there.

And you might not have met the += operator before.

It's a very common thing, forget strings for a minute, to say I is equal to I plus 2.

Number of employees in department is equal to number of employees in department, know that we already had, plus new employees who were just hired.

Something that people do a lot.

And in the early days of computing, when performance was a really big deal and optimizers weren't as powerful as they are today.

It was actually quicker to use this += operator than to take the two numbers, add them together and store the result back in the original number.

Now it's really just a convenience, so I don't have to type greeting is equal to greeting plus comma I know you.

It just saves me from typing the variable name greeting twice and that's the plus equals operator.

You may also notice minus equals, times equals, and divides equals as well and they're simply a convenience to save you from typing a variable name multiple times.

Once I've built the greeting string, I'm then going to put it out on the screen and we're done.

So, let's run this.

Who are you? I'll tell it the truth first.

It says, Hello, Kate.

I know you! If I run it again, someone.

Hello, someone.

So, it doesn't put on the I know you.

I think you were expecting this output.

I think this code is perfectly readable.

That's one of the really cool things about the string class in the standard library that, really it feels exactly the way the integers did.

We've got a value into it using the extraction operator from I stream.

We built a string out of pieces with a plus operator.

We tested two strings against each other with the equals operator.

Everything's smooth, simple, what you would expect, intuitive.

When C++ is done right, classes feel like built in types.
String Manipulation

Let me just review the string work you saw in that quick demo.

You want to combine two strings, you can use the plus operator, like hello plus name, or the plus equals, like greeting plus equals, I know you.

If you want to test two strings, compare them to each other, you can use the equals equals operator.

True if they're the same, false if they're different.

The less than, the greater than.

And the not equal to.

They do what you think they do.

They work by comparing the string contents.

And you saw the cout insertion operator and the cin extraction operator working very nicely with strings in both directions.

There's more.

The string class has member functions.

I mentioned those before.

Now I'd like to show you how to use them.

I'm going to show you length, substring, and find.

There are others, but these are enough for you to get the idea of the mechanisms of using member functions, and what member functions are for.
Demo: String Manipulation

I've added a little more code to use the member functions string.

To use a member function from any class, you take an object that's an instance of that class like greeting here is a string.

You say dot and then the name of the function, round brackets, whatever its parameters are, end round brackets.

Length doesn't take any parameters.

It returns, I hope this isn't a surprise, the length of the string.

If the greeting is hello, with five characters, comma, space, we're up to six, seven, and then you type in a ten character name.

I would expect it to say 17 for the answer.

Of course there might be, I know you, tacked on the end to make it longer.

Then I'm going to print out, greeting is however many characters long.

It's an interesting problem.

How do you tell the computer you actually want a double quote.

If your strings are wrapped up in double quotes.

If you just said quote quote, this way, oh, string's over, okay.

So in C++ we have the concept of escaping special characters, and especially quotes.

So, these two characters right here, back slash, double quote, mean, I really mean a double quote.

And there, wrapped up in double quotes, beginning and end, the same as hello or who are you or anything else would be.

And we have here, slightly longer string, that starts with a literal double quote, and then says space is space.

And when I run this, you'll see quotes around the greeting.

Whether it's hello someone, or hello Kate, I know you, or, whatever it is.

You'll actually see double-quotes being output onto the screen, through using this escape character.

So, greeting is however many l, is the result that we got back from greeting.

length, characters long.

Now, I'm going to call a function called Find.

And when I hover over it Visual Studio tells me what it returns and that's a really, really long type that it returns.

I don't care.

So, I'm just using auto.

I don't tend to type out with my keyboard the name of what it is that Find returns.

I'm only going to pass space right to another function called substring.

Find is going to give me back a pointer, essentially, to a place within the string where there is a space, back to the first such place.

So, greeting is hello, comma, space, and then the person's name, and possibly, comma, space, I know you and lots more spaces in there.

But the first one will be right after hello comma.

Then I'm going to use yet another member function again, the name of the object, greeting, dot, the name of the function, round bracket, its parameters, end round bracket.

That's always the way for calling member functions.

And it takes an iterator.

We'll talk more about iterators very shortly.

And I want to go one more than that.

And substring, if you give it just a single parameter like this, will go from the place you give it to the end.

So, if you said your name was someone, Hello, comma, space, someone, we'd find the space, move one further and by taking the substring, we'd end up with someone.

If I say my name is Kate, we'll end up with Kate, I know you.

And I'm taking the result of that substring function and putting it in another string called beginning, printing it out and then testing that against name because I'm expecting them to be the same.

If they are, I will just print out, expected results.

And that's the end of the code that I've added to this demo.

So, let's run it, first I won't say I'm Kate, I'll say I'm someone.

It says, hello someone, and then, see the quotes, because I put those, escape characters in.

Hello someone is 14 characters long, you're welcome to count for yourself, and see that that's correct.

And then the substring comes out as just someone which as we expected is the same as the person's name.

If I run it again this time I say I'm me, it says hello Kate, I know you.

Then again we have double quotes around greeting, hello Kate, I know you is now 24 characters long and it just returns, Kate, I know you.

So, all it's doing is taking off the hello comma space.

And it's not saying expected result because that doesn't match the original name.

Using member functions like length, find and substring opens up more capabilities than just the plus and the minus and the sending it to output and filling it from input.

This is where real manipulation can start to happen.

And the mechanism, the syntax, is going to be the same not just for the string class but for every class and every object, every user defined type.

And you'd have an object.

function name, open round bracket, whatever parameters it takes, closed round bracket.

We've got a number of strings in this application.

Greeting.

length is, of course, not going to be the same as name.

length or beginning.

length.

You have to say whose length you want.

It's a member function that operates on a particular instance of the class.

You have to say which instance of the class you want it to operate on.

That's why the syntax looks like that.
Exercise: String Manipulation

I think it's a good time for an exercise.

It's been a while since I asked you to write some code, and remember to really get this stuff, I feel that you have to try writing some code yourself.

Making it up yourself, composing it yourself, your own variable names, doing things in whatever order feels right to you.

So, here's your problem statement.

Write a program that just asks the user to enter two words and tells them which one is longer.

So, if I enter cat and elephant, it will tell me the second one is longer.

If I enter turtle and pig, it'll tell me the first one is longer, and if I enter cat and dog, it'll tell me they're both the same length.

That kind of might remind you of some of the structure in Guess My Number, where, you know, if what they guessed was less than the answer, you said, you guessed too low, if what they guessed was higher than the answer you said, you guessed too high, and if what they guessed was the same as the answer, you told them they got it right.

You don't have to put that loop that goes over and over until they say to stop.

You can just run once, or if you feel like going to the loop that does it over and over, that's fine.

Obviously, you're going to use the Length function of strings to figure out how long the string is and be able to compare the length of the two strings.

I'd like you to pause this video now.

And try to solve this problem.

You can rewind and take a look at the code that I showed you that was putting something the user typed into a string.

The code that I showed you that figured out the length of a string.

You know everything you need to know to solve this problem, so pause the video and go write the code.

I hope you did that.

If you got it working, did you try entering two words separated by spaces? A phrase, rather than just a word? If you want to, try doing it on your code and seeing what happens.

I'm going to show you the solution now and I'm going to do that to my code so you can see what happens and I'm going to explain why it happens.

This is your last chance to pause and go write your own code before you see mine.

Here's my solution.

I include iostream and string, because I want to put things on the screen and because I want to work with strings.

Then I declare a couple of local member variables, word1 and word2, both of type string.

Then I prompt the user for a word, which I put into word1, and another one, which I put into word2.

Then I simply compare them.

If word1.

length, using that syntax to call a member function is equal to word2.

length, then they're the same length and that's what will print out on the screen.

If word1.

length is greater than word2.

length, the first word is longer.

If word1.

length is less than word2.

length, the second word is longer.

There are lots of other ways you could have done this.

For example, you could have declared some local integers, like length one and length two, put word one dot length into length one, word two dot length into length two, and then said if length one is equal to length two, if length one is greater than length two, if length one is less than length two.

The advantage of that as I've written this solution we're going to call this function three times.

This is just little demo apps they don't take long so it doesn't really waste anything to do that.

But sometimes that might be a long and complicated function and you don't want to call it three times.

Call it once, save the answer, use the answer multiple times.

I tend to discourage that kind of thinking early on.

People sometimes call it premature optimization.

In fact, as many compilers can do this sort of thing for you and say, oh, I see you keep calling the same function, and you're not really changing word one in between, so why don't I just save that somewhere.

But if you would like to, you can make a local variable, give it a name like length of word one and just call the length function once and then test that local variable instead of calling the function over and over.

You might also have wanted to repeat the words in here, the first word, comma cat is longer than the second word, comma i and even use that escape trick I showed you to put double quotes around it.

If you did that, fantastic.

Let's test this code of mine.

It builds.

That's a good sign.

So, let's run it.

And let's say dog and elephant.

The second word is longer.

Yay.

Run it again.

Cat.

Turtle.

Second word is longer.

Well, let's just put them in the other order.

The first word is longer.

Okay.

One more time.

Dog.

And cat, same length.

Fantastic.

Now, I asked you what would happen if you ran this and you put in a phrase.

So, if I were to say dog, cat, turtle, elephant.

A really odd thing happens.

We get the prompt, enter another word, no spaces, and then immediately, they are the same length.

Maybe you saw a similar thing happened when you tried this.

Stream il thinks of both the output that we're writing to and the input that we're reading from as a stream, a steady stream of input coming towards us.

When you use cin's extraction operator like this, it just picks the first word off the stream.

When you don't take all the words that there are.

So, I put dog cat turtle elephant and the first line of code that ran it into word one, took dog, got to a space said okay, that's all, that's all I need; took dog and when the next line of code went to run to pull the next one, cat was already waiting there for it.

And so it didn't pause for me to type something.

Let's run it again and behave this time.

I'll say dog, IO stream, library, goes to get the next token out of the stream.

There's nothing there, and so it's sitting waiting for me to type something.

When I type cat, it's like okay, got it.

And then it can move on.

But when I typed a bunch of them at once, the first one, just pulled one.

The second time, it pulled another one right out of that waiting stream.

That's how stream IO works.

This might feel like, oh my gosh, this is going to ruin everything for me, how can I write my application? But first of all, you're probably not really going to write a console application in real life.

You're going to use some sort of framework.

And the way you get input from the user is going to be different from getting stream IO from the keyboard.

Second there are functions that let you, for example, get an entire line of input or output at once.

I will show you that in action.

I should probably change the variable names from word, but we're going to bear with me.

It says the second word is longer.

Well, they're not words, they're phrases but it's certainly true that something something something is longer than dog cat turtle.

So, by using the get line function that takes as its first parameter, the stream.

And as the second parameter, where to put the results.

We now don't just go up to the first space, but we go up until you press enter.

We get an entire line of input from the string.

Depending on your motivations, you might continue to use the extraction operator to just get a word up to the first space or person hitting enter or whatever happens.

Or you might use get line to get an entire line up until a person hits enter.

I hope your exercise has worked, if it didn't please do look at the structure of this demo and see what you need to change in order to make yours work.
Vector

A really common thing to need in any C++ program is that you have a bunch of thingies, a collection of objects or possibly numbers that are all the same type.

All the people in a department, all the items in an order, all the transactions in your account.

All the numbers that you've generated randomly during some simulation.

All of the marks that you need to average or do some sort of statistical analysis on.

We call that idea have a bunch of thingies that I want to work with as a unit in some way and perform some manipulations on, that's a collection.

You might need to add up, if something's numerical, all the items in a collection.

You might want to sort a collection or count them, just know how many there are, whatever.

That need, is one that spans all different kinds of applications regardless of the business problem you're trying to solve, the game you're trying to write.

You will have this recur again and again that I'm going to have a bunch of thingies, don't want to work with them.

The Standard Library knows that people need collections.

And as a result, not surprisingly, there's a whole pile of useful collection classes.

The one I like, vector.

Sure there are others and when the time comes you can learn about others.

People sometimes choose things besides vector because they think the thing they're choosing would be faster, not only is that premature optimization which I already told you is a bad plan, but in fact vector can be very, very fast and it's just flat out useful.

It holds any number of items.

It, it makes itself bigger when you want to add more to it, so if you have a vector of ten items, you want to add an 11th item, you just add an 11th item.

And it makes itself bigger or whatever, it's not your problem.

You don't care.

And it's really easy to get a hold of the third item in the collection, or to do something to all the items in the collection.

And it's also easy to really manipulate to find a specific one, or rearrange them in a better order; because of the capabilities that are in the standard library.
Demo: vector

This is a new solution, it's called collections.

And just like all our others, it has a main.

We're including IO stream and strings.

I'm going to work with strings and I now have a new include, which is vector.

Again angle brackets because this is something from the standard library, and I'll explain this in a little while but I'm also including this header called algorithm.

Not everything that I need to do to vectors is in the vector header.

Sometimes, people are a little perturbed by that, but I say, hey, you know, say, for example, you want to write a string onto this screen or fill a string from the keyboard.

You have to include IO stream to do that.

People don't usually object if they're shown IO stream first and then they're shown string.

But what if I showed you string first, and then I said, oh, I want to put the string on the screen, so I include IO stream, you're like, what, I think I should be able to do everything I need from string just by including string.

It's not really how it works.

So, to work with objects, that are of the type, string or vector, you include that header, but some other kinds of things you want to do with those objects may require you to include another header.

Right here, I'm declaring the vector of integers, called vi.

And we've gotten some syntax happening that you might not have seen before, and that's these angle brackets.

This is how I say that this is a vector of integers.

In fact, let's just jump down the screen a little bit, here I'm making a vector of strings, called vs.

That's the magic of vector right there Somebody sat down and wrote vector once, and I can use it to make a vector of integers or a vector of strings or a vector of doubles or a vector of dates, employees, nuclear reactors, whatever.

The mechanics of keeping track of a collection of things and making yourself bigger when someone wants to add another one and all of that, are handled is a very generic way.

Vector is, we say, a template class, because you can, sort of, punch out from a pattern or a template vector of integer, vector of strings, vector of whatever.

After I declare this vector of integers called vi I have a loop.

We did four loops a little while ago, so for int i is equal to 0 semicolon i is less than 10 semicolon i plus, plus.

This is going to go 0, run through the loop, increment 1 is 1 less than 10? Yes it is.

Go through the loop again.

Increment, now it's 2, and so on.

Until eventually we get 9.

We go through, we come up, and we increment to 10.

Is 10 less than 10? No.

And come out of the loop.

It's just going to run 0 through 9.

Ten times.

And what it's going to do each time through the loop is it's going to call a member function of that vi object.

So, vi is an object.

We say vi, dot, name of the function, round brackets, the parameter and the round brackets.

The particular function that I'm going to call on vector is called push back, which is a slightly odd name.

That puts an item on to the end of the vector.

Imagine that I somehow was given a vector that already had three integers in it.

I called dot pushback the fourth integer would get put in after the others.

There are other ways to get items into a vector, but pushback is the computationally cheapest.

That's the one we all kind of reach for right away.

You wouldn't expect things to be inserted in the beginning.

We normally think of putting things into a collection sticking them on the end of what's already there.

So, this language for Visual Studio turns the word for blue you've met before.

It's immediately followed by one that you haven't.

This particular piece of syntax sometimes called the ranged for or just range for, or range based for.

It's new in C++ 11, it's one of the things that makes the language so cool.

I'm saying take that, vector of integers, vi, and I'd like you to do something to each and every object in the vector exactly once.

We have 10 elements in this vector, 0 through 9.

So, I'd like to go through this loop 10 times.

There's no funny business, not going to do element 3 twice, or skip element 7, and I don't have to write as many characters, I don't have to figure out how long the vector is in order to use some sort of condition here.

I'm just going to say, for every element in the vector, do this.

And what is it that I want to do? I want to print it out on the screen followed by a space.

To film my vector of strings I am going to ask the user to type some things, so, I am going to print enter three words on the screen and then go through this loop three times.

And the loop body now will declare a string, use the extraction operator to get whatever the person typed into the string, and again, because it's a string, they can type three words.

A space B space C.

Pretty short words, but they can do it.

And this string operator will take each one in turn and put them into the local string S.

And then we'll call push back on vector of string.

And push back those strings into the vector.

And then do another one of these ranged for that says for each item in the vector of strings, put that on the screen with a space after it.

I intend to run this code.

But I'm hoping that at least some of you are saying.

Wait a minute, wait a minute, wait a minute, you've got a thing called item here, and you've got a thing called item here.

You've got a thing called i here, and you've got a thing called i here.

What's going on? And if you're not, well, I'd like you to.

Because the fact is, in C++, you must declare things before you use them, and you cannot declare them twice.

If I say int i is equal to 4, or minus 4, sure, and then again, int i is equal to 5, And then I build.

It says, What are you doing? You're redefining I.

If you look in the output.

Redefinition, see declaration of "i" already on an earlier line.

This is not allowed.

So, why can I say int i equals 0 here, and int i equals 0 here? The answer is, scope.

This i only has scope until this brace bracket.

Brace brackets, in general, tend to end scope.

And this i only has scope until this brace bracket.

So, right here, if I type i equals 4, you see there's a red wiggles underneath it.

And I can try to build.

Undeclared identifier.

It's like, I don't know what you're talking about.

I've never heard of i.

Now, that's obviously not correct.

It, it has heard of i.

But this is its complaint.

Because by the time we get down to this line, this i is now out of scope.

When I first started talking about local variables, I said, I'll come back and explain the local.

Now, perhaps, it's a little clearer.

These variables are little local scope that can end.

Just as when you call a function, a variable inside the function called x has nothing to do with the variable inside main called x, they're just local to their own scope.

The same here.

Each of these i's, and in this loop and in this loop, and local to their own loop and don't exist between the two.

This item just exists in this loop.

This item just exists in this loop.

Vi has a much bigger scope.

He stays in existence.

His scope persists right down till the end when we return 0.

And hit that brace after the return zero, that's when vi will go out of scope.

It's also when vs will go out of scope.

So, if I just said, oh I think vs is a great name for an integer.

Whoa, what's going on! You're, again, redefinition of vs, it's already been declared to be a vector of strings and I'm not allowed to declare it to be something else.

So far, I've really only shown you the push back member function of vector.

One of the absolute cornerstones of C++ is type safety.

If I were to try to put a fourth string into vs......

and try to build that.

It's fine, one succeeded.

If I now take that same s and I try to push back that onto the vi, the vector of integers.

That's not okay.

The error message way out here says, I cannot convert parameter one from string to an integer.

Don't worry about the punctuation after integer for now.

And, then it goes on for a while, cannot convert from string to int, no conversion operator available.

Basically, the complaint is, vi is a vector of integers.

You may only push onto it integers.

I tried to push onto it as string.

What if I try to push on a double like 3.

2.

Can you guess? There is a line of output.

We've scrolled across through an awful lot of lines of output.

Did you have warning conversion from double to int? Possible loss of data? Because that's the deal, right? Same as when you say int i is equal to 3.

2.

And it's like, oh, I'm going to be converting from double to int.

Exactly the same thing here.

Push back takes an integer.

And just as the free functions, like add, when you gave them things that were a slightly different type, if it can convert, it will.

Maybe with a warning.

If it can't convert like string and integer, then it just yells at you and you get an error.

And we have complete type safety.

A vector of integers can't have a string put on to it.

A vector's strong can't have an integer put onto it.

A vector of employees can't have an insurance policy put onto it.

We have complete type safety.

Okay, let's stop messing about with our things that we know will cause compile errors.

Build this again.

You've seen how to put elements into the vector with pushback, and you've seen how to go through the entire vector with the ranged for.

Let's go and do some other things.

Here's a member function on vi called size.

Tells you how many elements are in the vector.

If you remember, way up here, we went 0 through 9, we put 10 elements into the vector so I'd expect int vector vi has, I'd expect that to be 10 elements.

These next two lines, I'm using square brackets to access particular elements of the vector.

And this is always a zero-based index.

So, if I say vi at 1 is equal to 99.

That's actually the second element in the vector.

Then I'm going to use the range for again to print all of the elements out onto the screen.

And I'm going to just do something in Visual Studio to make my application run just up to here, so that I can show you some of the output kind of halfway through without getting confused by output that follows.

Here's the output.

The 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, that's this declaration of vi.

Let's make a little more room here to see the code.

This is declaration of vi.

We pushed 0 through 9 on it.

And then we used the ranged for to put out all the contents of that vector.

The next that happens, I'm asked to enter three words.

Going to enter three very exciting, but easy to type words.

And it says a, b, c.

And then it says as we expected, int vector vi has 10 elements.

And then, the code that changed the individual elements, we changed element number five to three, element number six to minus one.

There's three, there's minus one.

Element number five which used to have five in it, element number six which used to have six in it.

And element number one which is the second element has 99 in it.

Now I'm going to show you three different ways to print the entire contents of our vector of integers.

This is the nicest one.

The first choice every time; auto item colon vi.

That'll do it once for every item in vi.

This one, you could write, I've shown you everything you need to know to write it.

It's a for loop, just like the loop that filled it.

I is equal to 0, I is less than vi.

size, just like word.

length.

I plus plus, so that'll do element 0, then element 1, then element 2, da da da da da.

Till it gets to, it would be asking for element 10.

10 is not less than size, so it doesn't ask for element 10, which is good, cause, it wouldn't be a good thing if it did.

And then we're using the square brackets to access that particular element; element 0, element one element two and so on of the list.

This for loop isn't wrong but there is a problem with it.

You have to read it carefully.

You have to make sure are you saying less than or did you accidentally say less than or equal too.

Are you just saying size, or is there a plus one or a minus one kicking around in it? Are you incrementing properly? Did you start out properly? Just as a minor tweak, I have to say unsigned int, which is probably a type you've never seen before.

Because size returned unsigned int, then if I just say int I, I get a warning.

It's not a big deal.

You probably would have lived with the warning.

And then I also have to carefully read this loop because you could change I in the loop.

Incremented again or decremented; which is i minus, minus or just frankly say i equals 7.

If you felt like it.

And I have to read the loop and make sure oh yeah, okay, mm-hm, mm-hm.

It's going to go through 0 is less than 10, only incrementing it once; so it's going to touch each one of them exactly once.

Okay, I get it Whereas here, because I'm using the ranged for, i know the minute I read it, it's going to touch each element exactly once.

There's another way as well.

This loop down here, instead of using an integer, we're using iterators.

Now, I referred briefly to iterators when we were doing the string demo.

There is a function called begin.

There is a member function begin of vector, but I prefer to use this free function called begin for reasons that are a little advanced to discuss right now.

Begin takes a vector and returns an iterator that points to the beginning of the vector.

I don't feel like typing out the declaration of the iterator so I'm using auto.

And takes a vector and returns an iterator that means you've gone past the end.

So, we can say, as long as my iterator is not equal to that special value, I can continue to increment.

And when you increment an iterator you don't numerically add one to it, you just cause it to point to the next item in the collection.

And then instead of saying vi square brackets I to access element number 0, element number one, we just use the iterator.

Here this star symbol.

We call it getting to the contents of the iterator, or what the iterator is pointing at.

So, if the iterator is pointing at the first element star I will get me 0.

When it goes to the second element, element number one, star i will be 99.

That's what I, what I changed that value to and so on all the way through the loop.

And again, this is, this is hard to read.

Did I call begin, did I call end? Am I incrementing properly? Am I incrementing or decrementing the iterator anywhere in the loop? It's also reasonably hard to write.

I have to remember to say star i which is something you've probably not done before.

And it still does the same thing as this.

Why did I show you three loops that do exactly the same thing? Partly because other people trying to teach you C++ may show you this one.

Or this one, and I want you to know that they do the same thing, but that this one is nicer.

Now, let's do something with this vector of strings.

I'm going to use iterators here because I want to use a function called sort.

Sort is not a member function of vector.

You don't take your vector and say vi.

sort vs.

sort.

Instead it's a free function and for maximum flexibility you might be wanting to sort half your collection, like from the beginning to the middle.

So, you have to specify the range that you want to sort.

We want to sort all of vs in other words from the beginning to the end of vs.

That's a little bit difficult, but this part's really easy, and it's really expressive like.

What am I doing? I guess I'm sorting it.

And then I'm just going print it out so that you can see that I printed it out.

If I let this run up to here.

Put in my three words, there's the three printing outs that are just identical, with three different ways to print out our vector of integers, 0, 99, there's the 3, there's the -1.

And here, cat, dog, turtle.

They're in alphabetical order, c before d before t.

So, that simple one line of code sorts from the beginning of vs to the end of vs, is all that took to sort that vector in alphabetical order.

If it was a vector of integers, it would sort it in numerical order, and if it was a vector of your own types, you would have to help the library to know how to compare two of your types, which is easy to do, we'll get there.

That's a very powerful function, and very easy to use to get this capability without having to learn how to sort things, or go off and buy an algorithms book to figure out what's a good way to sort a collection.

We have more good things going on in here as well.

Here's a function called count, again, a free function.

Sort, count, these guys all came in with algorithm.

And there are other collections, besides vector.

And you sort them with sort.

And you count things in them with count.

And you use find.

And all of those things that its capabilities are collection-wide, not just for vector, or just for one particular type of collection.

So, just a sort went from the beginning of vs to the end of vs, our vectors of strings, I want count to go from the beginning of vi to the end of vi, our vector of integers.

And to count how many threes it has, and print that out.

And now I'm going to create a pretty complicated line, that I believe you can read along with me, as long as you read it from the inside out.

I'm going to take vs square bracket 0, that is the first entry in my vector of strings, entry number 0.

That string is, itself, a container of a bunch of letters and so I'm going to call begin not on all of vs, but on that string of that first word, and I'm going to call end on the same thing.

And count the t's.

So, let's let this run one more time.

Dog, cat, turtle.

Same output we had before, let's count the threes our self.

There's one, there's another.

We just printed the same vector out three different ways.

Our strings come out alphabetically, cat, dog, turtle.

Vector events has two elements with value three.

That's correct.

So, count works like a charm.

And here it says first word has one letter t's.

That's right.

Cat does indeed have one t in it.

If I run it again.

This time if I say, a bunch of words that will sort after turtle in the alphabet, and let it run.

The first word has two letter ts.

Yes, turtle has two letter ts in it.

So, that's how simple it is to use sort, to use count, these functionalities that come from the standard library make vector and string even more useful.

And you can see how you can put these together into an application that really does something that you need to get done.
More on vector

That was a long demo so I thought I'd summarize it for you.

To add items into a vector, you use pushback.

There is a member insert, but you should use that only if you really need it.

Very important that we have that type safety.

When you add an item into a collection, it has to match what the collection is a collection of.

So, we declared something to be a vector of integers using those angle brackets, you're only going to be able to put integers into it, and if you try to pass anything else to it the compiler will try converting it to an integer.

If that is successful, maybe there'll be a warning.

If that's not successful, there's going to be an error.

The types must match.

When you want to get to the things you put in the vector, you can use that range based for.

You can use that operator square brackets.

And you can use iterators, which you get from begin and end.

And there is an operator on iterator called ++ that increments it to point to the next element in the vector and there's an operator called star that says, I don't want to talk to an iterator, I want to talk to the thing it's pointing to, the second string or the 11th integer or what have you.

You saw a number of free functions like count and sort as well as begin and end and there are so many more in the standard library.

When you need them you can look them up.

And you even saw that string is itself a collection.

A very special collection of characters, and you can call begin to get an iterator, that's aiming at the first character in the string.

You can call end to get an iterator that represents going past the end of the string.

And you can use the same functions like count and sort to work with the characters inside a string.

Just as you've used to work with the strings in a vector of strings, where the integers in a vector of integers.
Behind More Curtains

At the very start of the course, I had to show you some code that I couldn't really explain.

Just trust me you have to type these brace brackets, you have to type the letters MAIN.

But before long, I could show you, hey main is just a function.

It's a real special name.

When you first saw, including io stream, it's like, don't worry about what these symbols mean.

But now, you get it.

You know, you could include a number of headers and the angle brackets are for the standard library includes and the quotes are for your own.

Operators are actually just functions with really weird names and you call them using the operator notation instead of the round brackets notation.

When you add two integers, int i is equal to 3 plus 4.

That's really using some capabilities built into the language.

When you add two strings, greeting and name, it's using a function that was written in the string class.

It doesn't feel like you're calling it a function because you just said plus, but that's in fact what you're doing.

You saw string operators, plus, plus equals, equals equals to compare them.

You saw square brackets on vector to access the first element or the third element.

You saw the extraction and insertion operators.

For all the io stream classes, you saw the star for the iterator and the ++ for the iterator.

Those were all operators, they were all calling functions that were written by the people who wrote those classes for you.

This is called operator overloading.

When you write a class, string, vector, io string, classes like i string, and o string.

You can write functions that are called using this operator's syntax, and the result is that the user defined types where the user is a library writer feel exactly like built in types like int and double.

You can use the operators you already know how to use, you don't need to read any documentation on what cout, angle bracket, angle bracket or as I like to pronounce it from x does.

You know what that does, whether x is an integer or a string or an insurance policy.

It's going to send something to the screen based on the contents of that object.

That feels really natural.

It also is sort of the magic that makes C++ templates work.

You see, templates work on any type without giving up type safety.

They work on built-in types like integers, bools and doubles, and user-defined types defined by a library writer the way string is or by you like Employee, or Order Item.

One of the reasons they work that way is because they use operator overloads.

If instead of adding with plus you assumed there was a member function called dot add, open bracket, round bracket, that you could call.

That would work great for employee and order item as long as whoever wrote employee and order item remembered to write the function ADD add.

But it wouldn't work for integers and bools, and doubles because they don't have member functions.

Using plus means as long as someone's written plus for employee in order item, now it'll work for all of the types.

It's a huge adjustment in ease of thinking compared to some languages that don't have operator overloads.

And I think for someone's who's new to programming, you may bump into people who tell you wow, operator rivlo is so complicated, and hard and you know what, I am not going to pretend it isn't complicated to write one, but it sure as heck isn't complicated to use one.

Adding two strings together with plus, comparing two strings with equals equals that feels just super normal.

If anything I'd like a few more overloads like why can't I add an element to a vector with a plus equals operator that be kind of fun.

Why do I have to call dot push underscore back.

So, you can see how it would be very intuitive to do.

Using operator overloads and using templates are both really simple to do and let you tap into the power of C++.
Summary

This module was all about making classes part of your lexicon, part of what you know how to deal with.

So, I showed you the string class.

It's powerful, it's useful, it's got these great operator overloads that you can just work with.

It's got member functions like length and it works with some free functions like count.

Standard Library has a variety of classes for collections.

I like vector and I showed you how to use vector.

You saw how simple it is to sort one or to count how many elements in a vector have a particular value, like three.

This was also really a way to introduce the idea of using templates, where we can generalize over types but we don't lose type safety.

Somebody wrote vector, it works for integers, it works for strings, it works for employees, it works for bank accounts or order items.

Works for anything, but if you have a vector of integers, you can only put integers into it.

You have a vector of bank accounts, you can only put bank accounts into it.

So, you don't lose type safety.

But you're not writing boilerplate code.

You can learn how to write a vector class, at least one that's mostly correct, in a very introductory course.

But, why would you want to solve a problem that someone else already solved? Someone's written a great vector that's efficient and that works even in all the weird cases.

Great.

Use it.

Use it with your classes.

The person who wrote it's never heard of your classes but it will work with them.

And that's the template mechanism.

One of the keys to the template mechanism working is operator overloading in C++.

That lets you use things like plus and equals equals and less than, with user defined types from the library like string, or your own, which we will get to, exactly the way you use built-in types, like ints and bool.

That capability makes templates so powerful and also makes your code so readable.
Writing Classes
Introduction

Hi.

Welcome back to Learn How to Program with C++.

My name is Kate Gregory, and I am introducing you to programing using C++.

Throughout this course I have shown you how to use something before showing you how to create it yourself.

Here is how to use code someone else wrote.

By using something from our library say, to put some characters on the screen, now here is how to write a function.

See how that's the same.

You've also now seen how to use classes.

String is a class and you make instances of it.

Strings with individual names like name and greeting.

And iStream is a class.

And there's an object that's an instance of it called See In that you use to get characters someone typed on the screen.

oStream's a class, and there's an object that you can use that's an instance of that class See Out, that you can use to put characters onto the screen.

So in this module, you'll see how to design a class.

How to write a class, and then how to create and use instances of the class, which are also called objects, to actually have your application do something.
A Class of Your Own

A class, remember, is the definition of a user-defined type.

And when you write a class, you write instructions to the compiler in which you explain just what this class is, does, knows, has, whatever the verbs you want to throw in there.

At its heart, A class definition defines the data that's held in the class.

So, if I were writing a class to describe a customer.

I might decide the first name, the last name, the address, and the phone number were all good data.

And then every customer object would have values for those pieces of data.

If I was writing a class to represent some sort of account.

In a banking system or a credit card system or really anything.

I might have an account number that I print on the statements.

A balance.

A list of all the transactions that have happened in the account.

And perhaps some other properties as well.

If this is an interest-bearing account perhaps I keep track of the rate at which interest is paid.

That kind of thing.

Before C++ was a language.

There were other languages in the universe that had the ability to take data that belonged together and clump it together, and you can see there's a tremendous benefit to that.

You can pass it to a function just as one thing, rather than as five or six separate things.

But what really makes objects cool is that in addition to data, they have functions.

Typically the functions work with the data that's inside the class.

If I'm writing a customer class I might have a function like full name.

And for each different instance, each customer object, the full name function would work with the first and last name of that customer.

And return that customer's full name.

This is just like the length function in string.

If you called it on name would return the length of name but if you called it on greeting it would return the length of greeting.

And so on.

You don't just use member functions to ask a question like what's your full name or what's the length of you.

You can also use to get things done.

So you might have a function that posts a transaction into an account.

And it does all the work of posting that transaction.

That's really key to a well-designed object.

That you save people who are going to use the object from having to remember things.

So just to give an example with strings, when you packed on some more characters onto the end of a string with plus equals, you didn't have to remember to call refresh length, or update length, or anything like that.

the string now knows it's new length, and when you ask it its length, it remembers its new length.

It's all self-contained.

It kind of looks after itself.

Operator overloads that are so handy with the objects I first started you off, the cout, cin, and whatever instances of a string you create, are really just functions with a funny name.

Writing operator overloads is not super beginner technique, so we're not going to start there, but when it comes time, you can write an operator overload as a member function of the class that you're defining.

And an interesting thing happens when you keep the data in with the functions.

The same person is responsible for changing them kind of in sync.

If I'm keeping track of first name, last name, address, phone number and I decide actually I need your mobile number also I can change the data and the functions at the same time to reflect that business rule change that's just happened.

This is probably easier to understand with an example, so why don't I give you one.
Design

I've come up with a design, but I need to give you a disclaimer, which is that it's super simplistic and not realistic.

I don't think any of you are going to run off and start your own internet bank using the sample code from this session, so I'm okay with it being super simplistic, and not realistic.

I just want to make something you can run and see some output from, and understand what it means to write a class.

So in this system I'm going to have an account.

And your account keeps track of a balance.

You can think of it as a bank account of some kind, if you like.

And the balance is affected by transactions, and this account is going to keep a log of those transactions, and we're going to use the handy collection class vector and just have a vector of transactions.

So, yes, I'm actually going to design and implement two classes, account and transaction.

Member functions on account.

We're going to have deposit and withdraw to put money in and take money out.

And a reporting function that will give us some way of figuring out if our code is correct and doing the right things.

In real life the bank would update your passbook right or print you a monthly statement that it could send you in the paper mail.

Or put something in a place where you could see it from a website, that kind of thing.

I want to do something that will let us see how things are going.

It's tempting to write a function that puts output on the screen but I don't like that Even in an overly simplified design.

A good design principle is that you don't want to take dependencies like that, I have a screen to print to, deep in the heart of your business logic.

This account class should work no matter what kind of system I end up putting it into.

Something for a phone, something for the Web, something for a Windows machine, something for a Mac doesn't matter.

And if it thinks it can write to the console output, then only certain kinds of applications could use this class.

So a nice way for me to avoid depending on the existence of a screen is to have a report function that will just return some strings.

I could return one string, but then I'd need to figure out how to do line breaks, cause you just know anything banking oriented is going to be kind of line by line and tabular.

So I'll return a collection of strings.

And then the code that calls it can just take that collection, it's going to be a vector, right? Can take that vector of strings and print them all on the string or if I was writing something with a.

Graphical framework I could take that collection of strings and put them on the screen at different way not by using console output.

So this is a more general solution that doesn't depend on where the application is going to be used.

That's a good principle, willing to simply account to.

Only use things we've covered.

I'm not willing to write something that's a crummy design so we're going to depend on the abstract idea of a string rather than something concrete like the existence of a screen.

So in addition to account, I'm going to write transaction.

And of course, if you think about transactions in your own accounts.

When you look through the log, there's a date.

You probably kept sorted in date order.

And there is a way to do dates in C++, but I don't want to have to cover that just in order to do this design, so We'll just ignore that.

please, don't run a bank based on this sample code, right? We'll just keep the amount and the transaction type.

And there's some pretty good ways that we haven't covered yet to do the transaction type, but for now I'll use a string, the word deposit and the word withdraw.

And I'll put a report in transaction as well.

This doesn't need to be a collection of strings, because it wouldn't span multiple lines.

In fact, I hope it's not a spoiler if I point out that the report function in account is almost certainly going to call the report function in transaction, to get a string about each transaction.

And what that string will have for the transaction is the type like deposit or withdraw.

And the amount.

So what will the deposit function in account do? Well, there's supposed to be a vector of transactions, and because we want to keep all the smarts together inside, we don't ask the calling code to make a transaction and give it to account.

Instead, deposit will make that transaction, and add it to that vector.

It will also update the balance by the new amount.

So if you deposit $100, we'll increase your balance by $100.

Same with withdraw.

It will, of course, reduce your balance, rather than increasing it, but there's an extra business rule for withdraw.

And for this first iteration of the world's simplest banking system, you can't take out more than you have.

So if you have $98 and you want to withdraw $100, we need the answer to be sorry, no.

With that design, we should be able to code and exercise this system of classes, makes some objects, calls some member functions and see that the code works.
Coding a Class

Don't worry, I'm not going to give you an exercise, to okay go write account and transaction now that I've told you the design for them.

I need to explain some keywords, and some concepts, in C plus plus you need to know before you can code a class, and the first one is the idea of private and public.

The inside of a class, how you designed it, how you're implementing it, should be kept to yourself as much as possible, and C++ provides this keyword, private, to enable you to do that.

Essentially, You make as much private as you can because then you're free to change that later.

We're going to talk more about encapsulation after you've seen some of this code in action.

Now in contrast to the member variables, the functions, especially the functions you think of really early in the design, are public.

What good would deposit be if no other code could know it was there or rely on it? The whole point is that code should know that it's there, not how it's implemented inside, but that it exists and what parameters it takes.

Those we call services.

The class offers this service of all process so with deposit, I'll process a withdrawal.

I'll give you a report.

Those are public functions.

There's a special kind of function in a class called the constructor.

Not all classes need them, but some do.

You see, C++ does not initialize things for you.

You saw that when we said int I.

It just was set to uninitialized junk, whatever was in the memory before.

In a debug build it's sometimes set to a special signal value to let you know that you've made an error of thought.

But there's no zero would be a great value for any old integer.

Never, does not happen.

When you're talking about an object like a bank account or a transaction, this becomes even more important.

How do you get the first values into it? You could write functions to set the values, and sometimes that's the right choice.

If you think about a transaction in a banking system, why would you change it? After the fact.

Why would you go back into your bank account and in 2004 change one of your deposits from $10 to $10, 000.

I mean does that sound like a good thing to design into the system to even have that capability.

But if you don't have a way to change the values then you need to set them at the moment that you create the object.

And that's what a constructor is for, to initialize the number of variables in an object at the moment the object is constructed or created.

I'll show you how to do that and the syntax for it in the demo Now the name of the constructor, and this was simply a design decision in language, is the name of the class.

So it's not called create or initialize or setup or anything like that.

The constructor for account is called account, the constructor for transaction is called transaction, and so on.

And these very special functions have no return type, at which I don't mean they return void Like the functions I showed you earlier that don't return a value.

They have no return type.

They're very special.

Like any function, they can take parameters or not.

If they don't take parameters then this is a constructor that just kind of sets everything up with default values.

If they do take parameters it's because as the designer you've decided it doesn't make any sense to construct this object with default values.

You have to pass in the values you want to construct it with.
Organizing Files

If I were to say, okay, go write account, go write transaction, what would you do? Would you make one giant file and just type it all in? You could.

But it's not the usual approach.

So just as we were talking about functions, you can have all of the function definitions, and then main.

Or, you could have a header file that says I have these functions, and a cpp file that has a code for them.

And in the same way that the typical approach into cpp plus applications.

You have a header file that defines the class, so we'll have one for account, and one for transaction.

You'll have an implementation file, dot cpp.

That implements the functions of the class because they, there's code for them.

You, you have to write it.

It's not enough to say, hey I have a deposit function.

You actually somewhere have to put the thing that says I'm going to make a transaction, and I'm going to add it to the collection, and then I'm going to change the balance.

And, those will all go together in the cpp file to implement the member functions that you've defined for the class.

This header file.

Account.

h, transaction.

h.

Will get included by any code that wants to create an account object, or create a transaction object in the case of transaction.

h.

And also, and this is a little bit different than with the functions, You include that header in the CPP file that implements The gory details of the class.

Look back at functions.

h and functions.

cpp, from that earlier module, we didn't include functions.

h and functions.

cpp, that was because they weren't part of a class, so we didn't need to know anything about the class.

However, when you're defining member functions within a class, the compiler actually checks.

So if in the header file I say that account has a deposit function and then in the implementation file I say it's a process deposit function, then the compiler will say what? Account doesn't have a process deposit function I don't know what you're talking about.

And I'll go to compile error.

So I have to include the header and I have to make sure that when I promised it had a certain function that, that's the function that I implement.

So some key words that you're going to see in the demo.

The class keyword is how you define a class.

And you say class, open bracket, bunch of stuff, lines and lines and lines that explain the definition of the class, close brace bracket.

And then it's so important that I put it in red, a semicolon.

This semicolon has to be there.

You'll get these really weird error messages.

Just trust me on this.

Do not forget the semicolon at the end of that class definition.

The keywords private and public explain whether a particular member variable or member function is private or public and in C++ we say private and then a whole pile of functions in a row that are private or many as you need.

And then we say public.

A whole pile of functions and memory variables that are public and really no memory variable should ever be public.

And you can even go back and forth.

You can say private and list two or three.

Then go public and list two or three.

Then private and list two or three again.

But, as a matter of style I like to keep all the private stuff together and all the public stuff together.

The other thing you're going to see in the demo is something called the Scoperesolutionoperator, that's the pair of colons.

You've actually seen it before, but now you're going to kind of see it in all its glory.

So I have quite a lot of code to show you; let's get started.
Demo: Simple Classes

I've created a solution called SimpleClasses.

And you can see in here that I have three implementation files.

Account.

cpp, Transaction.

cpp, and SimpleClasses.

cpp.

And two header files.

Account.

h and Transaction.

h.

I'll go through all five files in turn, but we're going to start here in Simple Classes.

cpp.

I have a function called main.

Before main, I'm including iostream, because I intend to put things on the screen, and I'm using namespace standard.

And I'm including Account.

h.

That means that main knows about the account class.

Same as when you included string now your main knew about the string class.

I'm making and account object A1.

I could have multiple accounts in this name but I'm just going to make one.

I'm going to deposit $90 into this account.

And then print on the screen the words "after depositing 90" and an end line.

And now I have a little four loop.

This is range four that you saw before with collections.

If I hover over report, Visual Studio gives me this handy information, which it tells me about, what a function, for example, returns.

Report returns a vector of strings, which is what I said in the design that it does.

So this range for loop is going to take that vector of strings, it's not even going to put it in a variable of give it a name, it's just the, whatever I got back from report.

And then do this auto s in that collection.

So s is a string, which you can find out also by hovering over it, and we're going to go through every string in the report and print it out on the screen Followed by a newline.

You don't know yet what Report does, I haven't shown you the code for Report.

But we said in the design, it returns a collection of strings.

So it's going to do something, and we're going to print those strings out one per line, so you can see what happened.

The we are going to withdraw 50 dollars.

Now I haven't shown you the code for accounts so you don't know what an account starts with.

But it's a pretty good bet it starts with zero dollars.

So if we deposit 90, and withdraw 50, then we should have a balance of 40 dollars.

The we are going to try to withdraw 100 dollars.

And again, I'm not putting that return value in any kind of a variable, I'm just saying if the result of the return.

It's going to return true or false.

So if it returns true, we'll go into the if.

If it returns false we won't go into the if.

I could make a bull result equals A1.

withdraw but this kind of the way C++ people talk and think.

We tend to chain things up like this without creating a lot extra variables to hold values in.

So if the withdraw returned true that means it worked, and we'll print out second withdraw succeeds, and then an end line.

And in this particular implementation I'm not going to do anything if it failed.

Obviously in real life if people try to take money out of bank accounts and it fails you should probably let them know.

But I'm trying to keep the output to a minimum here.

So I'm going to withdraw 50 and then try to withdraw 100 and then we'll do another report on A1.

So we can see how that worked.

Do you need to see the code for account to understand this code? And these functions have pretty good names.

Deposit.

Report.

Withdraw.

You can understand what this code does without seeing the account class.

That's what we hoped for when we write a good class.

You never saw the code for string, but you know how string works.

And you wrote code that uses it.

You never saw the code for vector, but you know how vector works.

And, here, you could imagine somebody not knowing anything about how account works but sort of trusting these functions.

To work properly and to be doing what their names say they do.

Let's take a look at acoount.

h this is the file that declares the class, explains to the compiler what account is.

So we have class, account and then open brace and then down here at the bottom closed brace semicolon.

As a matter of style, I like to put all my private things first followed by all my public things.

You can find people who have different opinions this is just a preference of my own.

So we have the word private, colon and then all the private stuff, public colon and then all the public stuff.

Indentation doesn't matter to the compiler, but it matters a lot to humans and I like the particular pattern of indentation that you see here.

I'm using an integer just for simplicity.

This is really about writing a class.

Right? Not writing a bank.

Floating points are very rarely used in banking because they have accuracy issues.

If you have rounding errors and so forth you can actually have phantom money or lost money.

As a result of using floating points.

So it's traditional to use integers.

But an integer number of dollars isn't really a very good idea.

It probably be an integer number of pennies and we'd divide by 100 and multiply by a 100 all over the place.

I really don't want to get caught up in the banking I want to focus on what We're doing here in terms of writing a class.

So I made this gross simplification which is the balance is an integer number of dollars and, and just forgive me and bear with me, okay? And then, as I set in the design standard vector transaction at log.

Now, you may wonder when you this, why have I said std:: here? Why don't I have using namespace std? Up above class account.

The way I have it up above main.

The answer is that you should never use a name space with using name space std or any other name space in a header file.

Remember that the headers are just kind of pasted into the Implementation files where they're included.

People may end up using a name space without realizing it.

And getting ambiguous names or actually getting flat out errors as a result.

And so again as a style point of view, I never have a using name space statement in a header file, and I always spell them out in full.

So standard vector.

And here, standard vector of standard string.

So these private variables represent what you saw on the slide.

There's a balance and there's a vector of transactions.

And I've given that vector of transactions the name log.

My public functions, we have account.

That's a function with the same name as the class, so you know it's a constructor.

And no return type, again because it's a constructor.

And it doesn't take any parameters.

I and figure out how to initialize a bank, account.

Zero balance, empty vector We're done.

I don't need you to pass me in transactions to tell me what to initialize it to.

The report function's going to return a vector of strings.

The deposit function's going to take the integer, amt, short for amount.

And return true or false.

And withdraw's going to take also an amount, and return true or false.

So this header file is what the compiler sees.

It's basically a series of promises.

Explains what an account is, and what functions it has.

And that enables the compiler to look at these lines and say, all right, you're calling deposit.

I know that is a member function on account, which a1 is an account.

And you're passing an integer.

That's great.

compiler can also take a look at this line of code and say, yep, report returns a vector string, so that's a collection you can go through with arranged four, and each element in the collection as you go through in that ranged four is going to be a string, so it's fine for you to send it to standard output.

And it also knows that withdraw returns a Boolean value, true or false, so it's okay for you to use it in this if.

So everything here in account.

h keeps the compiler happy when it's processing that main function.

We have to actually implement these functions.

Report, deposit, withdraw, and the constructor.

And that implementation is in this file account.

cpp.

Here, it's safe to use namespace std, so I do.

I mean, there's no medals for typing.

I would rather not have to type std colon colon all over the place, and so, it's only in header files that I refrain from using it.

You see we're including account dot h in account dot cpp, and the compiler will check.

Do the functions I implement in here match the functions I declared in the header file? So we'll start with the constructor, and you may notice it starts account, colon, colon.

In fact, all of the functions start that way.

This is the way that you make it clear to the compiler and the linker.

I am writing, well let's take a look down here for a moment at report.

I'm writing the report function for the account class.

As opposed to the report function for the transaction class.

Or maybe there's some other class that has a function called deposit or withdraw.

We're giving the full names of the functions.

And that's why this pair of colons is called the scope resolution operator.

It helps to resolve the scope of a function or variable name.

Specifically here, I'm saying, I want the one in the account class.

So this is the constructor, it's in the account class scope resolution operator, the function name is account, and you can say that it takes void, or that it just takes nothing, that they're the same.

And the function body is empty, because specifically for constructors, there's this cool thing called initialization syntax, and that's what's happening here with this single colon You can only do it with constructors.

Constructors run when an object and instance of the class is being created, is being constructed and basically just need to give values to the member variables.

Sometimes you also want some action to happen.

You want to open a file, let's say, or print something to a log, but very often all you want to do is initialize your variables and this syntax is how it's done.

So colon balance, round brackets zero, round bracket, initializes the balance member variable to zero.

We have two member variable, balance and log.

I don't have to initialize log to anything, because as you saw when we were doing the module on collections, if I were to just say standard vector transaction log.

It would be initialized to a valid, but empty, vector suitable for having things added to it.

And that's perfect.

And therefore I don't need to do any special initialization of log in my account constructor.

Just need to initialize balance to zero.

the report function.

Account::Report doesn't take any parameters, returns a vector of strings.

I'll go through the code for this after I've shown you the code for transaction because I'm kind of relying on transaction.

So let's scroll down to deposit.

I'm going to have just a quick sanity check.

I don't know what would happen if you tried to deposit like, minus $100, that's kind of weird, you're probably up to something, so I'm going to make sure that you're depositing a number that's zero or more.

If your amount is greater than or equal to zero, I'm going to increment the balance using the good old plus equals operator, and then log as a vector, so I'm going to call the push back method to push a transaction on.

And the rest of this line is instantiating a transaction object by just saying the name of the class and passing in the parameters to instantiate a transaction object.

So, you know what I want to show you the header file for transaction.

this class open brace close brace, there's the semi colon, private stuff public stuff.

The private stuff is the amount and the type, we talked about that on the slide.

The public stuff is the constructor and report.

And the constructor takes the amount and kind is a synonym for type because I just didn't want to reuse the same words So that's what I'm calling here, the constructor that takes an amount and a type.

And deposits always work, so I'm going to return true.

If you're doing something weird like trying to deposit minus $100, I will return false on you.

So before withdraw, very similar, but with an extra check.

So are you trying to withdraw minus a $100? That's even fishier.

So assuming you're trying to withdraw a positive amount of money, I then check, is your balance greater than or equal to your amount? You have $100, you're trying to withdraw $90, we're golden.

You have $100, you're trying to withdraw $110, not so good.

So if your balance is more than your amount, I'll reduce you balance by the amount and create a transaction with the second parameter is withdraw rather than deposit and push that back onto the log and return true.

Otherwise, whether you're just short on cash or trying to pull a weird stunt, I'll return false.

So back to report, let's look at the header for transaction first.

You can see that report returns a string.

And so the report function for account.

Creates a vector of strings, and this is what I'm going to return, and then just pushes strings back onto it.

So the first thing I push back onto it is balances.

When you want to add something to a string with a plus, they need to both be strings.

Balance is an integer, not a string, so I'm using this helper function Called to string, which turns an integer, like 100, into a string.

You know, like quote 1, 0, 0 and that's subtly different from the number.

Then I'm going to push on just the header transactions.

And then, since log is a vector of transactions, I can just go through with a ranged four, and for every t.

In that vector.

I'll call it Report and push that back.

You saw that transaction has a report function that returns a string.

I'll take that string, push it back on, and then this line so that if I report on several different accounts in a row, I can tell them apart.

Having created this vector and pushed all these things onto it, and I don't know how many because I don't know how many transactions there are but a bunch, I can return that.

Back over here to Main, who turns around and goes through it with a range for pumping it out onto the screen.

But remember, if this was not a console application, maybe that vector of strings would get used in an entirely different way to get the output onto the screen.

So just to kind of cover all the bases.

Let's also show you transaction.

cpp.

We have a constructor, remember the constructor for transaction took two parameters.

An integer amount and a string.

For what kind of transaction it was.

And I'm just using that initialization syntax.

The same you saw to set balance to zero an account, to initialize the amount to the first parameter, and type to the second parameter.

And there doesn't need to be a body because the transaction constructor doesn't need to do anything more beyond that.

For a report I create this string and just plus equals things onto it.

Some spaces so the transactions will be indented.

The type which you remember is deposit or withdraw.

Another space.

And then the amount, and again I'm using that helper function to string.

That's in the standard names base by the way.

If you ever need it in a case where you're not using names based standard, you can say std : : to string.

To string.

Before we move off here, you'll notice that I'm using standard string here in transaction.

cpp, and yet I'm not including string.

That's because I include string in transaction.

h.

Similarly, in account.

h, I include vector and string, and then in account.

cpp, I'm using vector, I'm using string, but I didn't include them, because they were brought in when account.

h was brought in.

So you don't need to keep repeating the names of include if they are included in something that you're already including.

So I'm going to run this And let's compare this to the code in the main.

We started out by depositing $90 and then calling report.

So it says balance is 90, transactions, deposit 90.

And then there's the line from the bottom of the report function.

Then we withdraw $50, and try to withdraw another $100 it says.

After withdrawing $50 then $100 balance is $40.

Well, you know that's because the $100 withdrawal didn't work.

One of the ways you know the $100 withdrawal didn't work is you don't see second withdrawal succeeds anywhere on this screen.

So the balance is 40.

We had 90.

We took off 50, bringing us down 40.

We tried to do 100, which failed, so we're still at 40.

And the transactions list those out.

And that's a working, simple little class system.
Inline Functions

You see now what it takes to write a class, and the class statement, open brace, contents of the class.

Just the definitions, just to tell the compiler here's what the variables are, here's what the functions are.

End brace bracket, semi-colon.

Then in another file, you can implement all your functions.

Well, sometimes you have functions in a class that are really, really obvious.

Anyone reading the name can tell what the function does, and can also guess the code for it.

There is some benefit to having that code actually in the header file, in the declaration of class, rather than separately in the implementation file.

And experienced C++ developers, if they show you an example of this, will sometimes call that an inline function.

It's not strictly accurate.

You see, I try not to tell you too much about how the compiler works, because honestly computers are a lot faster than they used to be and we tend not care so much.

But when you call a function, there's a little bit of a performance impact.

Basically there's code generated to kind of keep track of your place, transfer control over to a whole another place within your binary file.

Execute some different lines of code and then transfer control back to where you came from And this overhead is small but real.

And so, C++ from a very early age has had this ability called inlining which makes something look like a function in your code but execute as though it wasn't a function when you're actually running it runtime, because C++ loves to be fast at runtime.

Inlining is a great thing, and is just none of our business as developers.

The compiler runs around and chooses to inline certain functions and chooses not to inline certain function, and there are ways for you to give it hints, but we're not supposed to worry our pretty little heads about that, and by and large that works for me.

However, one of the ways to give it a hint is to put the code in the header file, and as a result, people often call those inline functions.

It's a nice short name, and I'll go along with it, but I just needed to have a moment where I explained it was actually, they're, they're not exactly the same thing.

They overlap substantially, but they're not exactly the same thing.
Demo: Inline Functions

I've added a function to account.

You can see it here.

It's called GetBalance.

It doesn't take any parameters and it returns an integer.

You can guess that that integer is this balance.

Right? And here's the implementation.

Sure enough.

Return balance.

And here in my main, I've changed my first statement a little bit.

It now says after depositing $90, balance is, and then it calls a1.

GetBalance.

If I run this, it says, after depositing $90, balance is 90.

Kind of expect that and then there's the whole report which starts out by saying balance is 90.

I want to show you how to change GetBalance from the kind of function that deposit and withdraw are implemented here in the implementation file into what we loosely call an inline function.

I simply comment this out.

I could actually delete it, but I want to leave it here just as a reminder that there's more than one way to skin a cat.

And then here, I take away the semicolon, then I put brace brackets, like you would expect for the body of a function, and then I type the function.

Return balance, semicolon, cause it has to be valid C++ statement.

C++ statements end with semicolons.

There's no technical limit.

I could put lines and lines of code in here but as a style thing if you can't write it in a single line like this it probably shouldn't be in the header file.

It should be over in the implementation file.

When I make this change, I don't have to change any code that calls GetBalance.

And if I build it with control shift B, it builds just fine.

And if I run it, it works exactly as it did before which I hope is not a surprise.

That's how simple it is to write a function inside the header and for really short little functions it's the right thing to do.
Encapsulation

Encapsulation; this is the jargon that I used to justify making some things private and some things public.

It's a really, really important concept.

And it's way more than just using the magic words private and public.

Encapsulation is all about your freedom to change a class.

When something is private, and you remember variables really should all be private, no code outside the class Can count on the name or the type of that member variable.

Also if you had functions that were private.

Functions like initialize or reshuffle or archive.

The code outside the class can't call them.

What's the point of writing stuff that code outside the class can't use? Well if code outside can't rely on it, you can change it.

So I said, wow, you know integer balance is kind of stupid as a number of dollars and I'll put my hand up to that.

If you wanted to, you could change it so that it wasn't the balance in dollars, it was say the balance in pennies.

And, The functions would need change their implementation, by deposit a 100, we need to actually raise my balance by 100 times 100; because it's 10, 000 pennies to be 100 dollars.

But code outside wouldn't know that I've made that change, if I decided balance was a silly name and I wanted to call it Amount of money in the account.

I could do that.

No code outside the class would be affected, because it's private.

But, more importantly, the more you encapsulate by sort of putting functions in the way of people getting to the values, the easier it is for you to do the remembering.

Inside the class, and the easier it is for you to change the rules about what has to be remembered.

Right now, withdraw checks to see if your balance is greater than the amount you want to withdraw.

Anybody who wants to take money out of the account has to come through withdraw.

If you change the code for withdraw, you change the business rules for withdraw.

If you just let people talk to the balance all over the place, how would you be sure they were following all the right rules about making sure they added a transaction to the log, making sure they checked that there was a legitimate transaction before they did it, and so on? Now with all the member variables private, what if somebody wants to know the value of one of them? Well, that's why you add public member functions like GetBalance.

See, it's not about hiding the value of balance from code outside the class.

Any object anywhere that wants to know the balance of a bank account just needs to call GetBalance, and they'll get the numerical balance back.

It's about hiding your design, your decisions about making that a integer.

It could have bene represented in some other way, a float double, for example.

And That should be yours to change if your design needs to change.

So it's pretty common to have a get whatever, for every whatever that's a private member variable.

Don't always have a corresponding set whatever.

Sometimes you have A Get that doesn't have a name anywhere like what you're keeping.

For example for a person you might keep their birthday but have a function called get age.

That subtracted their birthday from today to figure out how old they are.

There's not a one to one correspondence like if I have a variable X I got to have a get X.

And there sure isn't a responsibility like I got to have a set X.

Most variables shouldn't just be arbitrarily set by code outside the class.

We talked about going back to a transaction ten years later and changing the amount.

That's crazy.

Why would I offer that as a service? I don't want a public function called set amount on transaction.

Once the amount is set, that's it.

don't change it.

But sometimes you will write a set whatever function, sometimes.

You'll be happiest as a developer if you have as few member functions as you can.

So when we designed account we said oh were going to need deposit, were going to need withdraw, we're going to need report.

When you're decoding it, if it got really long You might decide that you'd like some helper functions.

And you're going to simply your code by putting stuff that repeats itself into another function.

That's fine, that's a good idea.

Just don't make it a public function.

Make it a private function.

The more you encapsulate, the more you hide away from Code outside the class.

The less likely that changes you make inside your class, will ripple through and cause bugs throughout an application.

It's one of the real frustrations for developer working on a really large system.

you change one little thing, and something else at the far end breaks.

Encapsulation really strives to protect you from that, so that you can change things.

You know for a fact no one else was counting on them.

And therefore, your changes don't go any further.
Demo: Encapsulation

Why don't I show you the consequences of not bothering with encapsulation? I'm going to copy this line, Here and move this one here.

So now balance is a public variable of account.

This is a bad thing to do, and I'm going to show you why.

I'm going to go in here.

I'm going to deposit $90.

And then I'm going to just talk to that balance variable directly.

And add $10 to it.

I could call get balance or use the balance variable.

Whichever I prefer.

Now let's put an end line here.

So I'm going to deposit 90.

And then I'm going to just add 10 to the balance, and then we'll do this report.

And let's see what happens when I do that.

So says after depositing 90 balance is 90, now balance is 100.

Sure enough balance is 100 when we do the report, but when you look at the transactions they don't add up.

We deposited 90 And we have a balance of 100 and you know why, because you just saw what I did.

If I wanted to kind of be a good cheater, I would've also added something into the transaction log here.

But that brings us into that sort of, scary world of don't forget to do this and don't forget to do that, don't forget to do the other thing When, balance is private, let's just run this again.

I'll compile it.

I get error messages.

It says basically, what are you doing on line 12 in the, in the main.

You can't access that, it's private.

I double click it, it takes me to the line.

I can't do this anymore and rightly so.

Let's take these two lines away.

Keeping balance encapsulated, keeping it as a private member variable makes sure that anyone who wants to change the balance has to come through deposit Or come through withdrawal, and deposit and withdraw have code in them that remembers to put something on the transaction log and then when you print the report its always consistent and every one of your transactions got logged.

But let's try something else pretty cool.

You know in real life a lot of checking accounts have like an overdraft limit.

If I come in here and add another private variable.

Integer limit for my overdraft limit.

When I come in here to my constructor and I just, I mean in real life it would probably pend on something, but, I'm just proving a point.

So, we'll initialize limit to 100, you can go $100 overdrawn.

And now I'll change the code for withdraw from, if balance is greater than or equal to amount to, if balance plus limit.

So if you have $50 and you have overdraft limit of 100 and you want 100, well that's cool.

You have $50, and I'm willing to let you go $100 in the hole.

That's 150 that you could withdraw.

You're trying to withdraw 100, that's fine, that's 150's greater than 100, I'll let the transaction proceed.

So with this change, if I now build.

This code here has no idea that I changed account, right? It's still trying to withdraw 50, and then trying to withdraw 100.

If I run.

You see now it says second withdraw succeeds.

So I change the business rules for account, and I did not have to change any of the code that called or interacted with account.

It's just getting the new behavior.

So the balance goes down to minus 60, because we were at 90.

With a withdraw a 50 that took us down to 40.

And then we do withdrew another 100.

So now, we're at minus 60.

And I can continue on adding more and more capability.

You know, a lot of banks charge you service charges, right? Let's, again, for the sake of simplicity, make it an even dollar, for your service charges.

So what I'll do is when you do a deposit, I'll add in amount.

And I'll take off, I'll minus equal, hard coded $1, and I'll create a transaction, service charge, copy these lines also down into withdraw.

Let's fix up my indenting.

Let's run this.

I didn't change a thing in the main, right? After depositing 90, balance is 89.

Transactions deposit service charge.

Second withdraw still succeeds because I implemented overdraft's limits.

And you can see the balance is minus 63.

The deposit, and then a service charge, the withdraw then a service charge, withdraw and then a service charge.

If you want to, you could charge extra for going overdrawn or whatever you want but the key here is, is not my Other, unsuitability for running an international bank at service charges of a dollar a pop, but that I was able to go in and change the code and the count, and nobody had to remember.

They didn't have to go in to change names so that after lowering your balance, it remembered to charge you a service charge.

Deposit and withdraw remember to charge you a service charge, and that's really what the glory of encapsulation is.

That all the burden of remembering All the burden of knowing the business rules is put into the class.

The class knows all the rules, and the calling code just calls it.

So, if you want to write a game and you want to have monsters, you put all the rules about monsters in your monster class.

If you want to have treasure, you put all the rule about treasure in your treasure class.

If you want to write a line of business application and you've got orders and order items and whatever, you put all the rules about orders in the order class and all the rules about order items in the Order item class.

Everything is together.

Nobody has to remember things.

And you have the freedom to change things.

That's really the key power of an object oriented approach to coding.
Creating Instances

In the demo, you saw instances, objects, being created in more than one occasion.

But it kind of seems so natural that you almost don't notice it.

And I really need to kind of call your attention to it.

First of all remember that account had a destructor that didn't take any arguments.

That kind of destructor has a special name it's called the default constructor.

Just as you can have two functions with the same name, as long as you can tell them apart by the parameters they take, especially by the number of parameters that's a good one.

A class can have multiple constructors and the one that doesn't take any arguments is called the default constructor.

To use it you just create your instance, declare your object.

Your instance of this class or of this user defined type.

Same as you did with bits and types.

So account, acct, or account A1.

No extra special punctuation is just like end I.

When that happens the default constructor runs Doesn't take any parameters.

This is great because you aren't passing any to it and things get initialized.

The transaction constructor took some parameters.

You can create a local variable of type transaction called t like this.

Transaction t(amount, type) or 100 quote deposit.

Whatever you like.

As a general rule, this is the only way you should initialize your objects today.

Do not use the equal sign.

So for example, when you are declaring inter g, you could say integer i equals three.

You really don't want to say transaction t equals three.

Well, transactions need two parameters, but even if you had something whose contractually took one parameter, I'd rather not see an equal sign.

You certainly don't say, transaction t equals transaction round brackets, amount, type, that's weird.

Just don't have an equal sign if you're declaring and initializing an object.

Now I need to point out one kind of weird thing because sometimes what'll happen is someone will have a line like transaction, t, round, bracket, amount, comma, type, and then they'll change their mind, and they'll decide that transactions.

Doesn't need a constructor with any parameters and they want to take those away.

And they end up with something like this for account.

Account acct ().

You may think that declares and instance of an account class declares an object and doesn't happen to pass any parameters to its constructor.

But in fact this declares a function.

this declares a function called acct that doesn't take any perimeters, and returns an account.

Not what you were looking, because if you want to create an account without passing any parameters to the constructor, look up at the top of the screen where it says account acct; with no brackets, that's a very Frustrating problem to find because you just keep glancing over it with your eyes and thinking that you're doing the right thing.

And you're not.

You're declaring a function.

So be aware of that one when you're creating instances.
There's More ...

Later

So, is that all you need to know about classes and Instances of them also called objects and using them.

Well its most of what you need.

I mentioned at the outset that operator overloading is just a special kind of function that I'm not going to show you.

There's one other thing that I'm not going to show you now.

Not because it's particularly hard, but because it doesn't always apply.

For example, it didn't apply to the account or transaction classes that I showed you in this demo.

But some classes work with things that, kind of, are connected to the world.

Maybe, for example, they open a file.

If you open a file, you got to remember to close it.

May be they open a connection to a database or some network resource or something like that.

They need to close it.

There are any number of things like that where there is something you need to clean up when you're done.

And if I create an object and then it goes away We say it goes out of scope.

Even if it has a closed member function, a clean-up member function.

I may not be able to close it.

Or clean it up.

Because I can't call the function because the object has gone away.

In C++ there's a wonderful way to deal with this called the destructor, it's the opposite of the constructor.

The constructor constructs the class, the destructor destructs the class, or cleans it up.

And we have something called RAII, Resource Acquisition Is Initialization.

It's a reasonably complicated idiom that i can't explain Quickly, I'll just tell you what it's related to which is you sort of get things started in the constructor and you clean them up in the destructor.

And because both the constructor and destructor are culled for you automatically you really don't have to do a lot of work about this.

However when you do that you have to take into account copying.

If you open a file when you create an object and automatically close the file, when you delete the object, what would happen if two objects, because one was a copy of the other, had hold of something that pointed to the same file? And one object went away.

And then, going away closed the file.

And the other object thought the file was still open.

That's a runtime error.

When you get into classes like this that have to do with what we call lifetime management.

You have to worry about that.

You have to write a destructor.

You have to think about copying.

And there's code that has to be written.

It's not as hard as you might think.

Partly because Classes like the ones I just showed you, that just have some local variables, into balance vector of transactions log.

Don't need to worry about any of this.

Most C++ classes you write today don't need to worry about any of this.

So, later, if you start writing more complicated classes that are connecting to shared resources, or to resources that have to be managed in some way, like.

files that were opened have to be closed, and data misconnections that were opened have to be closed.

And you'll have to get into some of this lifetime management.

But you can see that just to write a simple classes, like our account and our transaction, you don't need to worry about life time management, and that's the most important thing for you to take away from this module.
Summary

In this module you saw how important it can be to write and use classes Writing a class starts with a good design.

If you design your class well, people use it the same way you can use built in types, like int, or library types like string.

So when you read through the main, you see oh, we're calling deposit, we're calling withdraw, we're calling report.

You don't really have to know how they work you can just kind of understand it.

A well-designed class hides its insides, puts them private so that you can change them without breaking other code.

And then people who are using the code, they don't have to take on the burden of remembering to do things.

Your code can remember to charge service charges.

Your code can remember to add something to the transaction log.

And nobody can change the balance Because it's private, unless they goes through your public functions and your public functions remember to add to the transaction log.

Ta-da, the transactions log always matches the balance, that's as simple as it often is.

Not just with artificially simple demo to, for use in a training course, but also in real life.

When things are properly encapsulated People don't have to keep track and remember, and have little checklists, because the class takes care of that.

And you also saw that it's a good practice to have one header file and one CPP file for each class.

Code that uses the class includes the header.

The code that implements the class also Includes that header and that's where all the code is to actually implement all those member functions.
Compiler Specific Topics
Introduction

Hi, welcome back to learn how to program with C++.

My name is Kate Gregory and I'm introducing you to programming using C++.

C++ is a complicated language.

And we started with the simple parts and worked our way forward, and we haven't covered all of it by any means.

But you can write programs that really do things.

But it also has some fairly complicated tools, and I've been glossing over some of the complications in the tools.

So, in this module, I'd like to spend a little time talking about the tools.

Visual studio, for example, will make projects for you, but they won't look like the projects I've been showing you.

So, I want to explain that a little bit further.

And, I want to show you a little bit about how to be more efficient if you're using a command line compiler, like the GCC compiler that we've been using as an alternative to Visual Studio throughout this course.

Or anything other compiler, like Clang on the Linux distribution of your choice, for example.

Just so that, kind of, nothing up my sleeve when it comes to the tools you'll be using.
Command Line Parameters

One of the first simplifications that I undertook, when I showed you your very first console application was that I made the signature of main, the function that really represents the entirety of a console application.

A little simpler than it often is.

If you break out a college level textbook on C++, especially one from some time ago, or if you ask a tool-like visual studio to make you a console application you'll see a signature for main that looks more like this.

It actually takes some parameters.

The reason I didn't want to talk about them, was because then I'd have to explain what char* argv that's really not information that C++ programmers need any more to get started.

This is how a C++ program finds out what you typed as a parameter at the command prompt.

Say we had an application called small.

You might run it like this.

Small.

exe - g Hello 12.

And this code could go through these parameters and use them to find out that you typed dash g and hello and 12.

And then there'd be some kind of if somewhere in your code that would change the way the application worked because it had been given these command line parameters.

Perhaps that seems really far-fetched to you.

Who would write something like that? Well, if you've been compiling along with the GCC compiler, you know we typed, say, g plus plus, the name of the compiler, a dot cpp, some file, b dot cpp, some other file, and those are the command line parameters to that compiler that tell it what file to compile.

So this is a real thing.

But remember I've said from the very beginning.

I don't think there's going to be a great career for all of you in running out and writing console applications.

We're just kind of using them as a way to explain the concepts, the syntax, the library that is C++.

If you're not writing a console application, if you're writing a Windows application, if you're writing a web service, if you're writing a library that's called from some other code, then, you know, there's no such thing as command line parameters, and this little tweak doesn't matter.

Just to kind of close the loop so that you know what these things are even though I'm not going to show you how to use them.

Argv square brackets, like that, means a, what we call a c style array or collection.

This is something much older than vector.

And it doesn't have anywhere near the same capability as vector.

For example, it doesn't know how many elements is in itself.

Char*.

That's character (so that's why you pronounce it car, or at least I do; there are people who say char), is a C style way of doing a string.

You saw how nice and easy it is to use standard strings, st::string as a class that has wonderful capabilities.

Before that, inherited from C, C++ has these other old kinds of strings, which are actually really challenging to work with, and which I don't like to show beginners how to use.

And I mentioned that the square bracket type arrays don't know how many elements are in them.

So argc is a count of how many arguments there are.

So the operating system is responsible for doing this.

DOS, if you're on DOS, you know, Unix, whatever variant you're on.

Will execute your program by calling main and will pass these parameters in.

And so, if I had typed Small.

exe -g Hello 12, argc would be three.

And argv would be a C-style array of pointers to arrays of characters that held -g in one of them, Hello in another one, and 12 in another.

I'm not going to give you a demo of this.

You don't want to learn how to work with either char*'s or square bracket arrays as a beginner.

Standard string and standard vector are excellent replacements.

Should you have the need to write a console application that takes arguments, then you will have to dive into this.

But if you don't have that need.

If you can just ask questions using c out and c in as you saw in the other demos throughout this course, do that and pay no attention to the so called real signature to main because it's just sort of leftovers from a different time.
Visual Studio

If you're using Visual Studio to follow along in this course.

You may have discovered there are a number of things that are different about it than what I was showing you on the screen.

On screen, I've tried to show you the sort of common denominator across all of the tools.

But Visual Studio adds things that I went ahead and took out in order to make the course consistent across tools.

And now I want to talk a little bit about those.

One interesting capability that it has is something called pre-compiled headers.

In order to make your compiles faster Visual Studio has this capability to take the headers you use the most and keep compiled versions of them around to make builds faster.

By default, it does this using a file called stdafx.

h.

I'll spare you the historical reasons where that name came from.

It's possible to change it, but by and large, that's what people leave it as.

And I'll show you that file shortly.

When you generate a new project using Visual Studio, it generates code that will work, unchanged, on both Unicode and non-Unicode applications.

And this comes from a time when not everything was Unicode, as pretty much you should be today, everything Unicode.

There are these clever.

Tricks that basically let you write the same code, then you set an option and actually different code comes out of the compiler, depending on whether you're writing for Unicode or non-Unicode.

I'll show you that code just so that you can recognize it.

I don't expect you to actually change your applications back and forth between Unicode and non-Unicode.

Again this is a sort of a historical thing.

When you, generate a project by asking Visual Studio to make one for you, it makes, a number of files, that you didn't see in any of the project I showed you.

In addition to stdafx.

h it makes something called targetver.

h and ReadMe.

txt.

And targetver.

h is a way of specifying what version of Windows your application supports, and ReadMe.

txt is simply a little note from Visual Studios saying hey, I made your project, here's what's in it.

And finally, Visual Studios supports what's called pragmas.

These are instructions to the pre-processor just like the include statement that control what gets brought in by the pre-processor but before the compiler stop and the pragma once statement ensures that a particular include file will not accidentally be included multiple times, such thing causes Silly errors like hey, you already declared this because you're bringing the same file in again, and the compiler can sometimes perceive that as things being defined twice.

I'll show you these in context, so that you can see how they work.
Demo: Visual Studio

I'm going to use Visual Studio to generate a new console application file.

New > Project.

And there is a tree here, I can choose Visual C++, Win32 Console Application.

By default it's going to put it in my projects folder.

I'll allow that.

And I'll call it VisualStudioConsoleApplication.

You get what appears to be just a okay I did that.

But it's actually step one of a two-step wizard.

So if I click Next, I can choose some settings.

I asked for console applications, so this says console application.

And there are some things here I checked for you that I'm just going to leave all of the defaults so you'll see what you get for the defaults.

I click finish.

Here's the completed application.

The target ver.

h that I mentioned, is this header, which is including some things about SDK, that's software development kit, and DDK, that's device development kit, versions.

And there's instructions about how to build for older versions of Windows.

No, pay no attention to that.

Just want to show you that it's a file that you can ignore.

Here's the readme I mentioned.

It's on pinsolution explore for a minute.

You can see it just walks through all of the files and tells you what they're for.

And explains them to you.

I'll very often delete this file because it really doesn't contain any information.

After you've created about two visual studio projects you do not need the information that is in here.

But you can leave it kicking around in your project if you want it won't hurt you it doesn't get compiled, it's just a text file.

Now here's the standard afx.h and you see here it's being included into main.

And if I open this file, it includes that targetver.

h along with a couple of other headers.

And these headers are what actually make the part of main I am about to show you.

Work.

The main signature is not main, it's _tmain.

And instead of taking a char* all lowercase, this takes an _T Car all upper case star.

Now when I was preparing the demos to show you earlier in the course I handled this like this.

Just delete these and we will just take that away and now it's simpler.

And I don't have to explain what the heck all this underscored t stuff is.

But.

Let's put it back.

Your code will work like this.

If I hover over underscore tmain, it says that it's the same as wmain which stands for wide main, which is actually the entry point for unicode applications.

And if I go into my project properties, Visual Studio will gives you this capability for setting all kinds of different things.

If I right-click the Project, choose Properties, here under General, we have this Character Set, and it says, Use Unicode Character Set.

If I change that to Not set, and hit OK, then come and hover over tmain again, now it just says main.

Now, I don't actually want you to change your applications not to use Unicode; these days, you should be using Unicode.

Let's bring the properties back up.

Put this back to Unicode And this comes back to being w main.

It's simply that the code _tmain will expand back out to whatever you need it to expand back out to, regardless of whether your application is Unicode or not.

The reason that works is because of these include statements that have been added into your stdafx.

h.

And specifically, this tchar.

h is the one that's responsible for this kind of little trick with the _T.

I would encourage you to take things out of standard afx.

h whenever you can.

If you're not using something, then why pay to have it be carried in your precompiled headers.

But if you leave the code as generated for you alone, and then take this include statement out Your application doesn't build because it doesn't know what underscore T car is.

It was defined in this header that you've taken out.

So do proceed with caution before you take things out of standard AFX.

H.

In every single C++ file in your solution will include standard afx.

h.

So if you put something in here, then you don't need to explicitly include it yourself anywhere else.

That's.

can be a good thing, but it can also be a bad thing.

Because you could be including things that you didn't realize that you were including.

So if you said to yourself, hey I bet everyone needs string.

And you added an include of string here.

You might really confuse someone who can't understand why code is sometimes working, even though they haven't included everything that they would need to include.

So proceed with caution before you add things to standard effects And here's the pragma once indicator.

This simply prevents accidental double including of files.

And it may not be supported by a different compiler, but when you see it in a visual studio project, that's what it lets you know.

It's simply to guard against accidental double including.

And saves you the kind of mental pressure of keeping track, oh, I'm including employee.

h, but I remember that it also always includes person.

h, so I better not deliberately include person.

h myself, because then it'll come in twice.

That kind of stuff makes you crazy.

So, you just put a pragma once in person, and then you can include it in all the files that might need it, and not worry that someone else already included it.

You might also notice that there is a standard a effects.

cpp.

This is really only here to make sure that standard a effects gets included in at least one file and gets precompiled.

So as it says you can add more headers into standard a effects.

h.

You do not add them.

Into standard day effects, that's cpp.

Basically once it's there, ignore it.

Don't touch it.

It's really not for you.

It's there to let the compiler work a little magic.

Although this main signature looks different, and although this file, and this project structure maybe look a little different than what you've seen, all of the code that I've used throughout this course will work in a console application that was generated for you by a visual studio that looks like this.

So you can ignore oh, wow, this is all different and just focus on basically once main starts, focus on what you need to do there.

It will all work.
Make Files

In another module I worked with a solution that had several different classes in it.

There was an account and transactions.

And, you saw that Visual Studio only built re-compiled files that had actually changed.

If you had a file that was not changed, it didn't re-compile it.

Other compilers can do that, too.

And, typically the command line compilers, like g++, do that through something called make files.

You can compile multiple files at once.

Just say, g++, a.

cpp, b.

cpp.

But, if you want to get into a situation where you only compile the files that have changed, or the files that depend on files that have changed, then make is the traditional way of handling that.

And, make is actually a separate tool that calls your compiler.

So, it could call g++ for compiling C++ code.

It could call gcc for compiling C code with the gcc compiler.

It could call Clang.

It could call whatever you like.

I'm going to show you how to do it with G++.

The other thing you need to know is that depending on the version you're using you may need to pass in a command line option to specify that you want the C++ 11 syntax.

I've used C++ 11 syntax throughout this course because that's what modern C++ is all about.

But if you happen to have an older version of the compiler you may need a switch.

I showed you way back in the tools module how to get MinGW and if you're using 10.

2 and up, which if you go out and get it right now that's what you'll be using cause you'll be watching the course after I've recorded it and that's the latest version of when I was recording it, then C++11 is the default.

But if you're using an older distribution of MinGW or if you're using a different compiler like check your documentation, and see whether it defaults to C++11.

And if it doesn't, see what command line option you need to pass in to say that that's the syntax you want to be compiled against.

Now, let me show you how to do make files.
Demo: Using Make

Here's a reminder of the files that we're in that simples classes project I showed in another module.

There's a console application here in simple classes dot CPP that works with a class called account.

To find in account.

h and account.

cpp.

And account makes use of a class called transaction to find in transaction.

h and transaction.

cpp.

So if I want to build this project using G plus plus, I can Open up a MinGW command prompt, which has the correct environment variable set.

Navigate my way here to the folder where the files are created.

I've done the DOS command der to show me all the files.

And now I can compile them.

Lots of different ways.

This is a pretty good one.

Just take all the.

cpp piles and compile them.

As always silence is golden.

Must have been great.

And if I do a directory again now you can see that in addition to my source files I have this a.

exe.

Remember that's the default executable name if I don't say anything different.

So I can run it.

And you may recognize or remember this code to put transactions in and out of an account.

That's not really the point.

The point is that it compiled and it ran.

And life is pretty good.

But this command line compiled every cpp file.

You know it took a little time, even with such a small amount of code, and with a real project if it took ten minutes you might be annoyed.

And even if it didn't, there's quite a lot of typing involved in this and shift up and down, star, dot and so on.

Maybe you'd like a simpler way to do it.

There's a command Called make which will build my project the exact same way.

It pumped out this line so I know what was going on.

It's going to use g++ and it's going to build Account.

cpp, Transaction.

cpp, SimpleClasses.

cpp and As an extra bonus it says, - O Simple.

Advantage of having done that is I know have Simple.

exe rather than good ol A.

exe.

And I can run Simple.

exe just so you can see it's still the same application.

So that was nice right? Let me show you why that worked.

By default the make command uses a file called makefile with no extensions.

Not makefile.

txt or anything.

And I can notepad that file.

And you'll see what it contains.

There's the command line.

And when you looking to make like this, it looks like a kind of magical invocation.

We say all colon, and then on a new line this is actually a single tab character, not, not a bunch of spaces.

I'm moving back and forth with the arrow keys in notepad.

And then this g++ Account.

cpp Transaction.

cpp SimpleClasses.

cpp -o Simple.

Well, if all you did was make this makefile, and use it, it's quicker to type the word make than to type G++, space, star, dot, cpp, enter, and we're getting the executables' names changed to simple from a while we're at it, so that's great.

But now let me show you a different make file.

This one's kind of more complicated.

What I've done is lay out all the dependencies.

Reading up from the bottom, this says if account dot H or simple class dot CPP which includes account adage, if either of these two files change...

I'm going to need you to compile simple classes dot CPP.

If Transaction.

h or Transaction.

cpp change, I'm going to need you to compile Transaction.

cpp.

Then, this line says, if Account.

cpp, Account.

h, or Transaction.

h change, I'm going to need you to compile Account.

cpp.

And each of these is labeled With a dot o file.

And if you think back all the way to the very beginning, when we talked about the phases of the compilation.

First we compiled to make object files.

And then we link those object files to make executables.

So if simpleclasses.

cpp or account.

h changes, we'll compile simpleclasses.

cpp to make simpleclasses.

o And similarly we might make transaction that'll account that o.

This line says if any one of the three dot o files has changed, then we're going to link them together into the simple executable.

And all, you have to have a thing that says all and this basically says the name of the thing you want to be all.

Now if all the files change then fine.

If there's no.

o files you know, then we'll build everything we'll compile each and every CPP file and then we'll link all those objects together.

But if only transaction.

h changed then we would compile account and transaction but not simple classes and then we'd link all the O's together.

So this is kind of cool.

If I run this when you want to use a specific make file, you say make dash f for the file name.

And then I'm using the tab in dos prompt to type the rest of the file name for me.

CH tab and it fills it in.

So the first time around it builds them all because those.

o files were not there.

Now I'm going to change transaction.

h.

It doesn't matter for our purposes if you don't remember exactly how this class works or any of that.

I'm going to make a meaningless change.

I'm just going to put a space on the end here and then save it.

So that back in here when I run the make again, you see that it compiled account, because account depends on transaction.

It compiled transaction because transaction obviously depends on transaction, but it did not compile simple clause that's CPP as you saw that it did earlier.

Here it didn't need to.

So this mg file has the ability to save you compiled times by only building things that depend on files that have changed.

There's that changes only mg file again On a really large project.

It's a pain to maintain this by hand.

You invent a new header file and you would have to go in and change all these different lines.

And put the new header file in the right line so the things that depend on it compile.

And there are tools so to generate them for you.

But on a simple project with just a handful of classes I think it's useful to see how it's done so you can kind of control your destiny.

And understand there really is no magic.

There's just tools that you carefully make to do what you want.
Summary

While that's some of the details about Visual Studio and command line compilers that I really didn't want to introduce the very first time we ever had a demo, but I couldn't wrap the course up without admitting that there was sort of more behind the scenes that you needed to know about.

The thing is that when you see simple examples like having main, but then if you go on a project that someone's looking after with Visual Studio maybe it's underscore t main.

Maybe in the textbook there aren't any parameters being passed in to main.

Maybe in the code that someone else wrote that you're going to take over, or the code that a tool generated for you, there are parameters in the main.

It's important that you sort of get to see those differences.

And if you're using Visual Studio, it will generate blank projects for you, and it adds files that you can ignore or even flat out remove when you're making a console application.

They're there for convenience, and they do provide some convenient capabilities.

I just didn't feel like explaining them early in this course so I took them away.

But now that you see that they're there they don't actually hurt you, and you can just flat out ignore them if you want to.

If you're using a command line compiler you're probably going to use the make utility to keep your build times as small as possible.

and make works with a file called the make file.

By default its name its name is make file but you can name it anything you like.

And while you have to write it yourself at least when you're getting started.

As I mentioned there are tools to write it for you later.

It will save you the time, to compile everything single thing when you've made one tiny change.

And it's a good utility to learn how to use, if you're using a command line compile.

If you want to look back over some old demos and follow along with them, now using the capabilities that you know about Visual Studio, or about G++, or, you can apply the same information to say, Clang.

I encourage you to do that before moving on to the next module.
Topics to Learn Later
Introduction

Hi, welcome back to Learn How to Program with C++.

My name is Kate Gregory and I'm introducing you to programming using C++.

And that's an important distinction.

I'm not trying to teach you all of C++.

I want you to be able to write a program, to be able to think of a problem.

Figure out a way you might solve it, or you might represent the information you want to work with and be able to write enough C++ to implement that program.

Enough that you can see something starting to happen, whatever it is that you wanted your program to do.

Because that's my philosophy I haven't taught you all of C++, and I'm not going to, at least not in this course.

I do want you to know how much more there is.

It's fine because you now know enough to learn the rest of C++ when you need it from an ordinary course aimed at programmers.

This module is just to make sure you know that the remaining topics exist to tell you about the parts I haven't touched on so you know what else is out there for you.
Lots of Syntax

Some languages are specifically written for beginners, for people who have never programmed before.

And they have a very small set of capabilities.

And there's usually only one way to do things.

Other languages are written for very specific problems, like making websites interactive.

C++ is a general purpose language, and that combined with its age, it's decades old, means that it has a lot of syntax, key words and library things going on.

That means there's lots of ways to do things.

Justo to take one example, if you want to do something over and over again, you could use the language for loop.

You could use while loop.

You could use the ranged for loop.

You could use function in the standard library called for_each.

Many of these are just equivalent.

There's no difference.

You could write it yourself or you could call it.

Sometimes, one way is faster than another, sometimes they're both the same speed, but one is, we call more expressive.

It shows people who are reading your code what you mean more clearly than, say, ten lines written out the long way.

Sometimes they're just handy for developers.

And nothing really ever gets taken out of C++ so there are things in C++ that were in C.

There are things in C++ that were in the C++ 98 or 03 standard and there are things that are new in C++ 11.

And when something better comes along the old thing doesn't get taken out of the language.

But most of us, if it genuinely is better, adopt the better thing.

As a result, especially if you look at old material, you can get really confused, because you can say, well, here's another way to do the exact same thing.

And like, well, okay, sure.

You know, in 2001 that was, that was how you did it.

But now, this is how you do it.

The key is not to let it overwhelm you.

If I can tell you eight different ways to go through some kind of a loop and do things over and over again, you are not required to know all eight ways in order to write a program, not even a program that does something over and over again.

At least at first, it's enough to know one.

Once you've gotten a little experience under your belt, then you might understand sort of the pain point that a particular variant offers you.

So you can write a loop using the language for four int I equals zero, I is less than 10.

I plus plus.

But if you want to go through a collection like a vector of objects, the ranged for is way handier.

But until you've used a collection, you don't see the motivation for the range for.

Once you have this sort of comfort, I can work the basics of the language, I get types, I get the way C++ thinks about the world.

Then you can be in a position to explore a little, here there's some other syntax hanging out there for me, I'm doing something that feels a little awkward, maybe I would like to learn if there's another way.

There's pretty much guaranteed to be another way to do the same thing.

The other thing to keep in mind is if you think of yourself now as being a beginner C++ programmer, you're maybe going to read some other people's code.

And run into something where you go, what? I don't even know what that is.

And then you'll feel kind of lost and off balance, and that's not right.

So, if I tell you that this other syntax is out there, even show you some tiny bits of it, then you'll be ready to learn that fully when it's time for you to use it.
Debugging

You must learn debugging.

Visual Studio has a debugger, but there are separate debuggers that work on a variety of platforms, and coordinate well with a variety of compilers.

When you want to understand the program you're writing, debugging is the way to go.

In this course, I put a lot of print statements.

Here's the values before we did that, here's the values after we did that.

It's simple and easy to understand, but for a real application, you wouldn't expect it to print out all of its internal calculations as it's going along so that you can check to see how it's going.

And it's annoying to take those statements out when you don't need them anymore.

Debugger basically gives you that capability.

It's not just for finding bugs.

It's actually for understanding.

Oh, we went into the if because the condition is true.

Oh, I see we went around the loop again.

Oh, I see there are now three elements in that vector.

You can watch your program execute, watch your values change, even understand oh, when I said account A, the constructor for account got called.

And you can arrange for the debugger to watch that function execute.

This give you a real grasp of how your program works.

What all the values are, when they change, what executes in what order, and how the language really works.

There's no substitute for debugging.

You know enough now To learn how to debug from any C++ material.

And there's plenty of it out there.

It can take a long time to be a good debugger.

But it's relatively quick to get some level of competence that will give you that oh, I see how many times we go around this loop.

I see how this variable is changing its value.

And even yes, I see why I'm calculating the wrong answer.

Learning to use your debugger makes you a better developer.

Developers who don't debug, and who just put print statements in, never really get how it's working inside.

It's far too big a topic for me to cover here.

Please go learn how to debug, and not just to put output statements in your program.

That's what's going to give you the confidence of knowing how the code you wrote is actually behaving.
Casting

A really important C++ concept is casting.

Changing things on purpose from one type to another.

As you know, C++ is a strongly typed language.

Every variable has a type and when you put values into them like this, the compiler will adjust.

So, 4.

9 is not an integer.

The compiler will put the integer part of it, four into i for you and give you A warning of some kind, a possible loss of data.

So when you're mixing and matching types like this, putting flowing pointer, double numbers into integers.

You sometimes get compiler warnings, sometimes you don't.

You sometimes get values at runtime that you weren't expecting like four instead of rounding up to five.

And it doesn't have to be unexpected or surprising.

By explicitly casting, in this case, the 4.

9 to an integer, you can achieve two very important things.

First of all, you can tell the compiler that you're doing it on purpose.

I sometimes joke that, if C++ had a motto, it would be, it's your foot and you can shoot it off if you want to.

Saying, I'm going to take this number, 4.

9 and convert it to an integer, the compiler's like, okay then, fine, and there'll be no more warning about it, because you are explicitly asking to have that conversion made.

It also tells other developers which could be your teammate or you colleague, but it could also just be you a year from now when you go back and read over your code.

That this is something a little bit out of the ordinary.

You're converting a value from one type to another and it's worth a look to make sure that it's really what everybody wanted to do The way you cast explicitly in C++ is with these template functions whose names end with cast.

So here I've written i is equal to static_cast<int>(4.

9).

And what this means is I am statically casting 4.

9 to an integer.

I could statically cast it to something else but that's just going to make the something else have to get implicitly converted to integer.

So I'm going to statically cast it to an integer.

It takes a little bit of typing and it's really easy to search for if you're trying to understand why a program is behaving oddly.

because it's kind of an awkward, static_cast is unlikely to be the name of any variable, so you can find it really easily with a search.

And it says, very firmly and clearly, I'm going to take 4.

9 and convert it to be an integer.

The reason it says static_cast is there are other ones.

There's dynamic cast, const cast, and reinterpret cast.

They are used in circumstances we really haven't covered yet.

So I'm not going to go and explain them to you in detail.

But I am going to demonstrate how the static cast will stop the warnings.

But it won't change the reality about what happens if you try to put 4.

9 into an integer.

It'll still get truncated.

Let me show you.
Demo: Casting

This is a demo from much earlier in this course.

And I hope you remember it.

Where we declared an integer and then put this non-integer value into it.

Where we learned about the auto keyword, so that here, j is an integer because I'm putting an integer into it, and here f is a double, because I'm putting a double into it, and then if I say j equals f, again we're putting a non-integer value into an integer.

If I compile this.

I get two warnings.

One on line 12, one on line 21.

And both of them saying you're converting from double to int, possible loss of data.

And if I were to run this application instead of 4.

9 it's just printing out four.

I'm now going to put these static casts in.

Saying that I want to cast to an integer, it's a templated function.

And just as when you were using the vector which is a template you had to say what you wanted a vector of, of integers or whatever else.

Here, I'm saying I want to statically cast to an integer.

And it's a function so I'm going to use round brackets to pass the value, 4.

9, to that function and the same thing down here with f.

If anything, it's even more important on this line, because both j and f were declared with the auto keyword, so just reading the code over, you're not exactly sure what their types are.

Of course, that's because they have horrible names.

Your programs will really do something.

this was one of the very earliest demos in the course.

As we moved forward, and started writing programs that really did things, variables got better names.

When you're just messing about putting numbers into things, it's hard to come up with a good name for that.

But if j and f had better names, perhaps you would know.

One would be called number of people, and you would expect that to be an integer, and f might be, I don't know, dollar budget, and you might expect that not necessarily to have to be an integer.

Still, it's easy to miss that an implicit conversion is being done for you by the compiler and calling it out here by saying static_cast to an integer makes that really obvious to anyone who reads the code.

I'm going to build it again.

This time there are no warnings.

That last line is the good old I'm making your executable now.

So zero warnings.

That's a good thing.

You really don't ever want warnings.

And when I read it over, I'm not going to accidentally miss the way I might have on that line that just said j equals f, I'm not going to miss that there was a conversion here.

And if I run the application, the output is identical.

Using the static cast does not change the run time behavior in any way.

It's simply telling the compiler while it's compiling it, yes, I know I am converting from one type to another.

It isn't that complicated but it is really important.

A warning you can ignore is bad, you should always try to make them go away.

And here we're making them go away by explicitly calling out in our code what we're doing.

It makes the compiler happy, but more important it explains to the developers who follow us, what on earth we were thinking.
The const Keyword

The idea of expressing your intent turns out to be a really key process in being a good C++ programmer.

There's lots of ways to do things.

And, therefore, the way you choose to do something carries information to the people who want to read your code later.

Which could in fact just be you when you come back to it after being away for a while.

The const keyword is one of those ways of expressing intent.

Has some other benefits as well.

Let's start with what it means.

When you use this keyword you're basically saying, this variable here doesn't vary.

You're like, what, what would be the point of that? But it lets you give a name to some value.

Once you do that, the compiler won't let you change it, which means that you can't accidentally make mistakes.

Say you want to go through a loop and do something the number of people times And then accidentally in the loop, you changed number of people, that would be a logic error if you didn't mean to, if you just, your fingers just typed the wrong things.

And the compiler does what you tell it to do, not what you want, so your code would run weirdly.

If you marked number of people as const, then when you tried to compile the line that changed the value, the compiler would be like, you said this value wouldn't change, and you'd get a compiler error.

So in that way, it can sort of save you from yourself.

The other thing that a compiler does is optimize your code.

Actually changes what happens at run time.

The order, for example, in which things happen to make it faster.

C++ is all about being faster.

And, if something isn't going to change, the compiler can do some optimizations based on that.

So, your code can just be faster by using the const keyword everywhere that you possibly can.

Here's one way to do it.

Const int amount equals 90, and you have to give it a value when you declare it, if it's constant like this.

You can't say constant amount, and later say amount equals 90, because the whole point is, you're never going to be allowed to say amount equals 90 if amount is const.

The other use of it is on a function, a member function, where you say, this function doesn't change the value of any of the member variables of this class.

Usually when I show people this they say, well, that's crazy, surely member functions always change something, some member variable of the object will get a new value.

Well if you think about the Account and transaction, and so on.

Sure, deposit changes the value of balance, withdraw changes the value of balance.

But there are usually a couple of functions in every class that don't.

For example, in the transaction, the report function that just returns a string built out of the values that were inside of the transaction, it doesn't change them.

Perfect.

I'll say that that function is const.

And you have to do it in the implementation file where you actually implement the function.

And also in the header file where you declare the function.

So two places.

Let me show you a little fun with const.
Demo: const

This is a copy of the simple classes demo from earlier in this course.

I've made a few changes which I'll show you when we get into the transaction class.

But let's start by looking at the main function.

Rather than hard coding a number that I pass down into the first deposit call.

I've created this constant amount is equal to 90, and then I pass amount down.

This code will compile.

No errors, or warnings.

If I uncomment this line, and build, you cannot assign to a variable that is constant, which is absolutely a perfect error message.

And that's exactly what's going on here.

I've got amount, which is const, and I'm trying to assign to it.

The other error that you get on this is, is not great, so I want to show it to you, because you may see it either in Visual Studio or in some other compilers.

It says, expression must be a modifiable lvalue.

And most beginners have no idea what an lvalue is.

And even modifiable may not kind of ring a bell.

But this error message.

You cannot assign to a variable that is const, I think makes it really clear what the issue is.

So I'll comment that line back out again.

There's no hope for it, I can't make it work I said that amount was const.

Let me show you what I've done in transaction.

The report function does not change the member variables amount and type at all, it simply reports on them.

So I've put the marker here in the header file.

And, here in the implementation file, as well.

When you look at it, you can see.

You can just read the code with your eyes and see that it doesn't change any variables.

But the compiler does actually check this for you.

So if I were to go into, say, Account, where I've also marked the report function as const, and try to mark the Deposit function as const.

And I'll do that in the header as well.

And build.

All, all kinds of things going on objecting basically to meet changing things as balance cannot be modified, because it's being accessed through a const object.

And these go on for a while.

And they all basically boil down to these two lines in Deposit, that changed the value of balance.

I simply cannot mark deposit as const.

Now, it builds again.

One of the things that happens when sometimes decides to get right about const is you have to get completely right with const.

So if report were calling some functions on balance, on log, or on limit that weren't marked as const Then the compiler will be, I can't guarantee that a report isn't changing these.

As a result, it's really important to do const early in a project.

As you design your solution.

I'm going to need a function called GetBalance.

You say to yourself, and right away, you mark it const, because you know it's not going to change anything.

It's just going to return the numerical value of balance.

As you design your report, you're going to make it const even maybe before you've written it.

In fact, I like your mental default to be that member functions will be const, and then when you realize that no, actually, duh, deposit's going to change the balance of the account, then you sort of take if off in your mind.

If you try to come back and sprinkle const on to a working system, it makes you crazy.

Because this code for account is calling functions that might be changing the value of these transactions that you're looping through for example.

If this t.

report was not marked as const.

So, get it right from the beginning as you design your system.

Design which functions will not change member variables.

And which functions will.

And when you're writing your code in main, if you have actual constants, like the number of pennies in a dollar or the number of seconds in a minute, or so on, you can declare them this way.

So that everybody understands they're const.

It improves the readability and it also can make your code work better or faster.
The Standard Library

Whatever kind of application you want to write, whatever kind of problem you want to solve, there are parts of it that are all yours.

Like if you're writing a game, there's whatever the hook, whatever the thing is that people are trying to do in the game.

If you're writing some business software, there's that business calculation you're trying to perform, those numbers you want to establish.

And then there's the part of your application that's kind of the same problems that many other developers have faced before.

In this course, I showed you I/O stream, to put characters onto the screen and read characters from the keyboard.

I showed you string that represents words and sentences and phrases and that you need to manipulate like, figure out how long they are and so many more things you can do with strings as well.

And vector for a collection.

All the transactions in the log of an account or all the people in a department or hundreds, thousands of different things that you might choose to represent with vectors, and you don't have to write that code, because it's in the standard library that comes with C++.

And there's a lot more, too.

There are other collections besides vector that can be used to look things up, for example in a dictionary or a lookup table, or store them in a more efficient way.

Keep them sorted.

All kinds of things.

And there are algorithms in the standard library that work on the collections to help you find a particular element.

Help you sort a collection.

For example go through and find all of the elements that meet a particular condition.

Or remove all of the elements that qualify for being removed.

As well, there are things that have nothing to do in collections.

There are classes in the standard library to represent complex numbers, or to generate series of almost random numbers, or something called regular expressions which is a way of looking for particular patterns.

In a string, you might look for two letters followed by a number because that's some sort of manipulation you're doing on the files you're reading, or whatever.

All there, and much, much more.

I couldn't possibly list everything that's in the standard library, and there's more being added all the time because large as it is, it isn't large enough.

Some other languages have much larger libraries that, automatically come with them.

For example, going and getting a file over the Internet.

Parsing XML or JSON.

These things are not, at the moment, in the standard library.

But, it would be cool if they were.

And what I'd like you to be able to think of doing is there's something I want to do is it unique to me or is it something other people have had to do before too? Like figuring out how long something takes or writing a file on to the hard drive or reading a file from the hard drive.

Hm, I bet this standard library has it and that's where you should be looking first.
Demo: The Standard Library

This is a reference site I like to use for finding my way around the standard library.

Cplusplus.

com/reference.

I'm going to skip over all the things that came from the C library, they are sort of here for historical reasons, there are some good things in there but they shouldn't be where you first start.

I mentioned the containers.

Here's good old vector, and there's a number of other container's available.

And I/O stream.

But there's all these other things as well.

Complex numbers, I mentioned.

Things to represent locales as part of a internationalization or localization effort.

Random numbers.

Regular expressions.

String, we talked about.

And a lot more.

There's more in the standard that isn't on this website.

This reference is working on being up to date.

But the standard keeps moving and changing and, especially in the area of the library.

It's super important.

This is ISOCPP.

org.

It's really your starting place when you want to do anything involving C++.

This is where you find out what's happening with standards.

This is where you can find articles, tutorials, videos, books, even stack overflow questions.

In the Standardization section, you can learn about the standardization process, who's on the committee, can you join, can you go to meetings? Spoiler alert, yes.

All you have to do is show up.

You're welcome.

And current status.

Now here, in addition to finding out about C++ 11, the latest standard, you can get this timeline or overview of what's going on for the next, well, at least half a decade.

This is the pace at which the standard and the library used to be updated Long gaps.

But this is today's pace and the pace that we'll be living with for the next few years.

And it's kind of crazy.

There's a lot going on here.

I'm not going to go through what each of these are and what they mean for you.

What I want you to know is, just because there isn't something in the standard library today doesn't mean that that very same capability you're hoping for isn't in the middle of being added.

And, because so many of the compiler vendors are on these committees, they are putting the capabilities into the compilers and into the libraries they ship with the compilers.

Even before they've made it into the standard.

So the times are looking good for someone who wants some library to do.

And obvious or repetitive piece of work that others have faced before.

There's a good chance what you'll find what you're looking for in the standard library either now or in the near future.
Passing Parameters

C++ uses a lot of functions, might be free functions that are not member functions of the class they just work on whatever you pass them.

Or they might be member functions that are members of a class that can work on the local variables as well as the members that are passed to them.

And whichever kind of functions you write by default they get a copy of the parameter that they're given.

So if I have a function that takes an integer the actual code inside the function is working with a copy of that integer.

Where this can matter is when instead of something simple like an integer or double.

It's taking like an object like a transaction or a string.

By default, we'll actually copy the object and give the function a fresh copy to work with.

That means that if the function changes the parameter that's given to it.

Say, for example, this foo function takes a transaction and then changes the amount of the transaction.

It'll only be changing that local copy.

And after the function has finished running the original object.

Deposit, in the sample code on this slide, won't have been changed by anything that happened inside the function.

Often, you want functions to change their parameters.

Not as often as you might think at first glance, because we have classes and we have member variables.

So, remember, the account class had a deposit function that changed its own member variables like the balance and the list of transactions.

But you might have a situation where you like to pass a variable down to a function and have that variable get changed, not some copy of it.

Well, in C++, we have complete control over that sort of thing.

So if I define the function this way, it's almost identical but I have that ampersand sticking in the, the function definition void.

That's what it returns.

Foo, that's the name of the function.

Transaction ampersand, which means a transaction reference, t.

Now this function takes a transaction by reference, and it means that when you call it saying foo at deposit The function actually gains a reference to the real deposit object, not a copy.

And then when you make changes inside the function, those changes actually affect the real object back in the calling context.

There is one reason why you might not want the copy and that's because it might be computationally expensive to copy a transaction.

And we know there's not much in a transaction.

There's a number in a little string so it's not computationally expensive.

But some objects are expensive to copy.

So if you pass by reference, there's no copy and that way your code will run faster.

But you don't want to change it so we like to pass it by const reference.

We just talked about const a couple of slides ago, it's when you tell the compiler you're not going to change the thing you're given.

So, this expresses your intent really clearly.

It says I'm passing this transaction by reference just to save the cost of the copy, and not because I want to change its value inside foo, whatever the heck foo is.

And then the compiler will enforce that for you.

If any coding foo tried to change the transaction, including by calling a member function of transaction that's not marked with const.

The compiler will be, oh, you can't do that you were given a const reference.

It's becoming less important now because some compilers can skip the copy for you anyway, but you'll see this pattern a lot.

Take it by const reference, because you want to save the copy, and yet it's not because you want to change it.
Demo: Passing Parameters

I have a little console application here that works with the transaction class.

It's a slightly modified version of transaction that I'll show you in a moment, but you'll see I've declared two functions up here before main.

One's called tryToChangeTransaction, and one's called changeTransaction.

TryToChangeTransaction takes a transaction just by value.

The way you've always been doing it so far, whereas change transaction takes a transaction reference.

That's how you pronounce this little piece of punctuation.

And they both call something called double amount.

Here's transaction and here's double amount.

Does what it says it does.

It just takes the member variable amount and star equals, that is multiplies it by 2, so this line is same as amount is equal to amount times 2 but with less typing.

Doesn't return anything, because it's just changing a member variable inside the class.

And, of course, it's not marked const, because it changes a member variable inside the class.

Whereas report is marked with const.

And I've implemented this function in line, so you won't see it.

In transaction.

cpp which just has the constructor and report in it.

That's kind of my infrastructure in place now let's take a look at what I've got for my main.

I'm going to create a transaction object and call its report method.

I'm going to call try to change transaction and pass that object into it, by value.

And I am going to call report on that again afterwards, we'll see how well that did, and then I'll call change transaction, which although you call the two the exact same way, change transaction takes a transaction reference, so it really will change a transaction which I will prove, by calling report again after that.

So, let's build this, and then I'll run it.

You can see that at first the transaction was a deposit of $50, and after passing that by value to try to change transaction, it didn't succeed because it's still a deposit of $50, but after passing it to change transaction by reference it really is changed, and now it's a deposit Of $100.

Now just to show you the compiler is kind of on our side.

If I go back into transaction.

h and I try to make this function const, which it clearly isn't.

You can see right for yourself that it's trying to change the value of amount.

And I build it.

Amount cannot be modified because it is being accessed through a const object.

So let's take that away.

And let's go back into our functions and try to have this one take a const transaction reference, rather than just a transaction reference.

We build that, cannot convert.

This is not the greatest error message, but, cannot convert this pointer from const transaction to transaction reference.

In the output, you get the error a little bit differently Same there but then it says conversion loses disqualifiers.

And what both of these are really, what you need to know is, I see the word const here, I don't see the word const here.

And solution is, don't take things by const reference that you intend to change.

We're going to call double amount on it, we're going to change it.

But I want you to see that the compiler is paying attention to what you say.

And that if it was your intention not to change the transaction you were passed, then you would take it as a const reference.

Here, obviously you can tell from the name of the function, that this function changes the transaction it's passed.

And therefore you don't take it as a const reference, you just plain take it as a reference.

There are even more ways in which C++ developers have control over what gets passed to functions, but these two are the ones I like for beginners.

You either pass it by value in which case a copy will be made.

Or you pass it by reference in which case there will be no copy, and you will actually be working with the original object.

So, even though it's called t in here You're actually reaching back to this deposit that was created in the calling context, and that's the one you're changing, because the function takes it by reference.
Managing Resources

I've written really simple classes in this course that just hold, you know, an integer.

An integer and a string.

Couple of integers and a vector of some other small objects.

Really all they're looking after is memory in the computer, variables.

But you may go on to write some classes in the future, that kind of connect to the real world.

Maybe for example, you have a class with one member function that opens a file.

And once it's open, other member functions that read from that file or write to that file, or both.

The way you could do that on most operating systems, when you open a file you get given something called a file handle.

You could keep that handle in a member variable, and use it for the reading and the writing.

Or maybe that you work with a database, so you have one function that opens the connection, and keeps something representing that open connection in a member variable and then using that to execute commands.

Insert, update, whatever against the database.

Or any other number of kind of realer things.

I mean, I understand you can't touch a database or a file, but they're still realer than just a number in memory.

The thing about these resources is you have to manage them, You know, you can't leave the file open.

So if you open the file, and then you read and read and read, read and then you're done, and you just kind of wander away and don't close it, Other processes may not be able to access it, you may have had this occasionally where you can't touch something; because another application has it open.

So you need to close it when you're done.

Now one approach is just to just write some function on your class, that gets called to do your cleanup, you might call it close or cleanup; in some other languages there is a tradition or a pattern involving a function called dispose The problem with all of these is that people can forget to call them.

C++ has an approach to this that can happen automatically in a guaranteed way.

There's a special object called a destructor.

It's the opposite of a constructor.

And just as the constructor's name is the name of the class, the destructor's name is the tilde symbol.

Follow by the name of the class.

On my keyboard the tilde is up by the numbers in that very top row before the one, and you have to hold Shift to get it.

I'm not going to teach you how to write a destructor because you have to write a class that manages something that opens a file or a database or what not, and works with it.

What I really want you to know, is that they exist and that the compiler calls them for your automatically the same way it calls the constructors automatically which means that nobody could ever forget to call it.
Scope

One of the really important concepts when it comes to this idea of managing resources and of constructors and destructors being called for you is the concept of scope.

Take a look at this little piece of code.

There's an open brace bracket for some reason.

It might be the start of a function.

It might be the start of some if block or for loop or anything.

It doesn't really matter.

And, we're declaring some objects here: int i; Account a; Transaction T.

There's no such thing as a constructor for an integer.

That i is just sitting there uninitialized, junky memory in it.

But a, if it has a default constructor, and if it didn't, this line wouldn't compile, the default constructor will run, and will, if you remember the account class, it'll have a balance of zero, and vector with no transactions in it.

The constructor for transaction will put 50 in the amount and the string deposit in the string for the type of transaction that it is.

And then, we could have all kinds of other code that went here, maybe applied that transaction into that account or did all kinds of things.

And, at some point, we're going to reach a close brace.

To go and match up with that open brace.

And in C++ the scope of I and A and T is from the start with that open brace to the end with that closed brace.

Once we reach that closed brace those objects we say go out of scope.

When the object comes into scope, the constructor runs.

The default constructor for a, and the constructor that takes two parameters for T.

When the objects go out of scope, the destructor runs.

Account and Transaction don't have destructors, so nothing happens.

But if these were objects that managed resources, their destructors would run when the object goes out of scope.

Typically, it's because control just gets there.

After we've done all our manipulations and we get to end of our block, control reaches the close brace, everybody goes out of scope, and then control carries on to whatever is after the close brace.

Now the really cool thing is what happens to the member variables of an object when an object goes out of scope.

T has inside it because it's a transaction, an integer and a string.

And those member variables go out of scope when T goes out of scope and they get cleaned up.

The string actually has a destructor, not that it's our business, which will clean things up.

When that account object goes out of scope.

Yeah, it's integers that's the limits in the balance.

They'll get cleaned up.

But so will the vector.

And vector has a destructor who takes care of everything that's in it.

So, there might be 50 transactions inside that vector.

And they will go out of scope and they will all get cleaned up.

And if for some reason it's not going to happen with a transaction class that it would have a database connection open, but if they did the destructor would run and the cleanup would happen, guaranteed.

Nothing for anyone to remember.

Now see people who really don't know any C++ or know C++ from long ago, they think it's really hard.

And they might say to you, why are you learning C++ for your first programming language.

It's so hard, there's memory management, there's destructors, oh it's so complicated.

What's complicated about it gets taken care of for you.

When these guys go out of scope, they get cleaned up.

String cleans up after itself.

Not your problem.

Vector cleans up after itself.

Not your problem.

In a world before we had string and before we had vector, oh, it would have been your problem.

You would have had to write some code.

It would have been awful.

Aren't you glad you're not learning to program 20 years ago? You know, now we have a nice, sane, safe mechanism for handling resource management.

And it's the mechanism we've had all along in C++, which is scope.

So if you get scope, resource management's not hard at all.
To Learn Elsewhere

I just cannot fit everything into one course.

And you don't need everything to get started.

You know enough to write some programs and to enable you to learn other people's libraries and frameworks to write other kinds of applications.

Somethings I can show you, at least a little bit of, and you'll remember them when you come back.

So, how to pass parameters by reference as well as by value.

The importance of scope.

Other things I know I cannot really show you at all, but I must say their names.

Otherwise, I will be doing you a disservice.

So you really have to learn about exceptions.

You can learn them in any C++ material like now.

Exceptions, are, a way to make your code neater, easier to read, and faster.

While guaranteeing the errors will not be ignored.

Because rather than checking the error code after every function to see if it worked or not you can just, kind of, go straight ahead and know that if anything really awful happens.

Like, if a file just isn't there anymore that you were in the middle of reading.

There will be a non-ignorable error signal that happens.

And, it will get to the code that can handle it and deal with it.

Exceptions are a concept that will be easier to understand when you get scope which is why I talked to you about scope already, because they change the flow of control.

But they're far too large of a topic for us to talk about in any detail.

They are the excellent way to handle very unusual errors, not that somebody typed a number that is too large but you know that a file disappeared from under you that kind of thing.

I also haven't spoken at all about the free store which also called the heap.

We've been creating all of our objects locally as stacked variables by saying int i or transaction t.

Sometimes, something that's larger than that or that's going to have a longer lifetime than that, needs to be created in a slightly different way and that's called the free store.

What you get when you create something on the free store instead of the object itself, you get a pointer to the object.

And then you have to work with pointers which is a little bit more difficult.

Modern C++ makes that easier with something called shared pointer and unique pointer that are both in the standard library.

So they can handle that resource management problem for you.

When you want to learn about the free store, when you want to learn about pointers, be very careful not to use, like your grandfather's textbook from 1998.

It's super important to read C++ 11 material, and learn modern material, because one of the biggest changes in C++ 11 is how we handle memory management and the free store.

It is not hard.

It is not scary.

But if you read the old books or watch the old courses, You will think it's scary.

Please make sure that you get your free store pointer memory management information from something that is C++ 11 going forward.

And you can learn there about things like RAII, resource acquisition is initialization, and the rule of three, and the rule of five.

But it's much much simpler than it ever used to be.

And finally Lambda's C++ 11 syntax change.

This is a way to take a few lines of code, one, three, five, and pass essentially that code as the parameter to a function.

Or put that code in a variable and say, later, when something or another happens, this is what I want you to do.

It's incredibly powerful.

Again, I cannot teach it at this level, but I want you to know that lambdas are there.

Because lambdas, for me, are what make the standard library usable in a way that they really weren't in the past.

As soon as you feel comfortable I want you to learn lambdas.
Minor Details

Once you've written some more applications of your own.

And you've really internalized the material from this course.

And then you've learned about exceptions, the free store and lambdas, at that point you will really know all the big parts of C++.

I don't want you to feel you're missing anything, so I'm going to list some little parts.

And you can learn about these in my other C++ courses, or in any modern C++, that is C++ 11 and later, material.

We talked about classes but we didn't get into inheritance.

And when you start talking about inheritance you also have to talk about virtual functions, polymorphism and C++ has multiple inheritance.

Just something to learn about later when you start to get into writing larger applications where inheritance can bring you some benefit.

There's a keyword called enum.

It stands for enumeration.

Remember when I had deposit and withdraw in the bank account, and I said there's a better way? The better way would be enum.

It's a great way to give names to little collections of values that you want to use, oh, for the suits of a deck of cards, or for the kinds of transactions that you support, or for the, regions, in a business application that needs to support, you know, the Northeast and the Northwest and so on.

It's just a convenience, really.

In an if statement, we use some very simple operations like if x is greater than 3.

Sometimes you want to be able to combine this, if x is greater than 3 and y is less than 2.

There's these special operators, ampersand, ampersand, which is the boolean and, and or bar, which some people pronounce pipe pipe.

And on my keyboard, that's a capital black slash.

That's the boolean or.

And C++ operators do something called shortcutting.

Too complicated to teach you now.

Something you may want to know about in the future.

You're going to have to learn how to interact with the operating system.

For example, if you're writing a program on Windows, how do you call a Windows function? For example, when you want to read from the hard drive or write to the hard drive or connect over the network.

These things involve getting the operating system to help you out.

In addition to the boolean operators, we have bitwise operators.

People wonder why there are two ampersands in a boolean and, it's because one ampersand is a bitwise and, and the or bar, or pipe, one of those is a bitwise or.

You're unlikely to do a lot of bitwise manipulation as a beginning programmer, but I'm including them here for the sake of completeness.

There's also a switch statement, which just saves you the trouble of writing a whole pile of ifs in a row.

because it's kind of weird to write, if x is equal to 2, if x is equal to 3 something, if x is equal to 4 something.

Because, you know, if it's equal to 2, it can't possibly be equal to 3 and neither can it be equal to 4.

And the switch statement kind of acknowledges that.

And it's a more compact way to test the same variable or expression again and again for all the different possible values you want to act on.

And there's more punctuation, there's a percent sign which is the mod operator representing the remainder that's left over after dividing.

So five mod two is one.

And you'll see people use mod very often for test like whether something is a multiple of something else or whether something is odd or even that kind of thing.

And then there's the ampersand, the star, and the, I call it arrow operator or points too operator, which is yes indeed made out of a minus and a greater than.

And these become relevant when you're working with pointers.

So, when you learn about the free store and working with pointers, you'll learn about these, and there's even a question mark which is sometimes called the ternary operator.

Just a bad name for it.

It is a ternary operator, but there could in some other languages be more than one.

I like to call it the immediate if.

Learn about when you need to learn about it, not before.

When you're writing a function that takes a parameter, you can provide a default value for that parameter.

Has its place.

I showed you how to use templates like vector, or, for that matter, static cast, but you can write your own.

Not exactly a beginner topic, but you can write your own.

And you can also write your own operator overloads, because it's just a function with a very special, weird name.
Summary

This module presented a lot of things you didn't know yet, but I still believe you already know enough C++ to write a real program.

Well, it may not have a shiny GUI interface.

It may not interact with the operating system very much or perform incredibly complicated calculations, but you can write a real application, and the fundamental basics are now there for you.

Depending on what kind of applications you want to write, you will need to learn a lot more.

You can write what we used to call Windows applications and we now sometimes have to qualify that to say, well, a desktop Windows application, to distinguish it from a Windows store application that runs in the modern user interface of Windows 8 and Windows 8.

1 and so on.

A Windows phone application or maybe a UNIX application or a web service or a Windows service.

Any number of kinds of applications with all different kinds of user interfaces.

And in order to write those you need to learn the frameworks and libraries that are used to write them.

And you have that basis now, that foundation to go and learn those libraries, to learn those frameworks, to figure out how to build a user interface for a particular kind of operating system.

So that will be your next step.

Choose a platform, choose the problem you want to solve and learn those frameworks and libraries to write that application on that platform.

And sometimes when you're going through that process you're going to have a need for a particular piece of C++ syntax.

Maybe you're finding something really difficult, it shouldn't be difficult.

There's probably some more C++ you can learn that would be an easier way to do it.

So you're writing out possible transaction types and you're concerned what if somebody passes in a string that is neither deposit, nor withdraw, nor service charge, how can I restrict it to just these three choices? Then you'll remember Oh yeah, C++ has that enum thing! I bet this would be a good place for me to use that capability.

Perhaps you want to create an object and not have it go out of scope when it reaches a close brace, but kick around for other things to share.

Then you'll remember the free store, and you can go learn about the free store, and so on When you need it.

There's lots waiting for you.

But you know enough now to get started on your own.
Legacy Constructs
Introduction

Hi welcome back to learn how to program with C++.

My name it Kate Gregory and I'm introducing you to programing using C++.

Most of the time developers write code, but especially when you're new to it you may not realize how often developers read code.

You might do it to understand how to use a particular framework, or library, or little piece of one.

How do I make this thing here resize automatically, you ask, and you go out on the internet, and you do some searches, and you find a piece of code, and you read it over and you say, oh I get it.

I know how to do it now, fantastic, and then, you don't necessarily copy and paste that into your application, but you certainly take what you've learned from reading that code and put it into your application.

And for C++ developers, one of the problems that can happen when you do that is you run into really old code, and C++ has changed as a language over the decades.

So there are things you're going to bump into in old code that you would not ever use yourself.

Rewriting that old code into shiny new modern code that's, that's safe and readable and much like the code I've been showing you elsewhere in this course.

That's way out of scope for a beginner, but I need to show you those kind of old school constructs, those ways we used to do it, literally 20 and more years ago, so that you can read them and understand them if you come across them.
Legacy Code

The word legacy, especially in front of code, is often really used as an insult, developers will say to each other, oh, this is a horrible project, there's so much legacy code in it.

It doesn't have to be that way, legacy code can be like a jewel that was handed down to you, tested, working, and looked after by someone else.

Code you didn't have to write, yay! However I'm totally meaning it in the mean sense in this module.

See the problem is that code has a permanence that is probably doesn't necessarily deserve.

A language changes, our habits change, the way we put applications together changes, and yet, there on that bookshelf is some book that might literally be 20 years old.

There on your favorite open source repository, is a cool project written by someone you really admire, or in a blog, or in an online magazine or anywhere that a search engine can take you to, and sometimes this code is really not the way we're writing C++ today.

It's possibly like that just because of hold it really is.

It's possibly like that because of the habits of the person who wrote it.

I went to a talk by Bjarne Stroustrup who invented C++ and still has a strong hand in what it is and what it's becoming, and he said when older developers write in this ancient, unreadable, un-maintainable and dangerous style.

Young developers read their code and say well my hero writes code like this so I should too, it's a real problem within our industry.

That old style dangerous, hard to read code is not what you should be striving for, but you will come across it because it never goes away.

You'll find it in books and online and how are you going to react to it? Well, why are you reading it? If you want to learn how to automatically resize the something or another you just want to learn from it.

That's fine, some of you may find yourselves being asked to look after that code, and keep it healthy and happy, and fix bugs in it, that's a really hard job.

That's not a first programming job, okay? Because it's so opaque and so hard to read and so unlike the code you should be writing today.

Some of you will just have an opportunity to use it.

Someone says, I wrote this cool library to, I don't know, Parse XML and you can have the source for it if you like, I have it something, you know, Source Forge, Code Plex, what have you.

And it, you look at the code and you're like, wow, I can't understand a word of this.

That might be okay if all you're going to do is use the library.

Or you might be taking a block of that code and trying to adapt it to your own purposes.

Here's a thousand lines of code that do just what you like, now make it works with your variable names, and your functions names and your objects.

And that's also a very difficult piece of work to do.

Rule of thumb, just want to use somebody's code, it doesn't matter how ugly it is.

If you want to learn from somebody's code, then you need to learn how to read these old constructs, but don't take those into your code.

Just find the little core thing oh this is the Windows API function that I call to set that up.

Great, and ignore all of the non-modern stuff that's around it.

As a beginner, really steer clear of being asked to maintain or to adapt large pieces of old legacy constructs before you're really familiar with the language.

It's much much easier to start by writing safe modern nice code and only occasionally reading this really old code.
What is Old Style?

How do you know if you've bumped across a piece a code, whether it's using old, scary legacy constructs or whether it's a delight of modern and wonderful C++? That's a real challenge.

If you were learning a new spoken language, say you were learning French, and somebody gave you a paragraph of French, you might not really know whether it was grammatical or not, whether it was well-written.

Certainly whether or not it was poetic and beautiful.

So I'll use a fairly circular definition now.

It's going to be legacy code full of old scary constructs, so it's full of the things I'm going to show you in this module.

And just as a kind of an overture, let me tell you what you can expect that to be.

The best case is something that is written in a reasonably modern style, but it was before C++ 11 was released, so there will be some particular capabilities that are in C++ 11 that this code is not adapted I haven't taught you lambdas yet, but you've seen the ranged for easily going through a whole collection, and you may be reading some code with for loops that are kind of a little longer and more complicated than they need to be, and you may say, why doesn't this person just use that ranged for? And the answer is probably because they wrote the code before there was a ranged for, which was fair enough.

And you, not maintaining that code, you don't have to go in there and change it.

You can just, when you bring it in to your life say, well, I would use a ranged four to go through that collection.

There are a lot of people out there who really don't like templates in C++ and that's a shame because there is tremendous power in those templates.

You know vector of integers, vector of doubles, vector of employees, vector of transactions all working the same way, marvelous.

Static cast, as a way to make that compiler warning go away, make it really clear what your intent is to convert between a couple of types.

And thousands more, really useful, simple templates that people know how to work.

And you may look at some code and say I don't get it.

Now that I understand what this code does, why aren't you using a vector? And very often the answer is because this developer didn't like templates and refused to use templates.

Okay.

It happens.

There was a time when the const keyword wasn't in the language.

And there was also a time when even though the const keyword was in the language, people didn't bother using it.

You know, some people are irritated by compiler error messages and they make the error message go away, rather than focusing on, maybe I'm doing something wrong in my program.

I often say the compiler is your friend, the compiler finds your mistakes.

Long before you run the application and let a user find your mistake.

So if you take that warning that you're taking a double and putting it into an integer, how awful would it be to just shut that warning up.

And then run the application, and then get the wrong answers because you were throwing away some of the precision.

You had, 7.

2, but it got truncated down to 7, and you calculate the wrong numerical answer.

The compiler is trying to save you from that.

And using const is another example of getting the compiler kind of on your side, getting the compiler to tell you when you are making errors of thought.

But, there are developers out there who are like, stupid compiler, I know what I'm doing.

And, ran around for example, not bothering to use const, and other ways that would have given them some support if they had taken them on.

You'll also see a lot of manual memory management.

There's things that you may have been warned about.

It's really unnecessary today.

But people use to do a lot of it.

A lot of pointers, a lot of cleaning up memory yourself when you think you might be done with it.

And you can find yourself in a situation, we have hundreds of lines of code, and 80% of it is housekeeping.

Looking after memory, looking after resources, trying to make sure things are closed, trying to make sure things are cleaned up.

Now when I take on a job to clean up code like that, I can end up making that 80% of the code just disappear.

By writing some objects that have intelligent constructors and destructors.

You're not going to try to clean this code up, what you're going to try to do is comb through it and find that ten or 20% of goodness in the center of it and say, oh, now I see what I have to call in order to accomplish whatever it is I'm want to accomplish.

So try to look through those Old habits.

Or the old way of managing memory.

The other thing you'll see a lot of in the old code is the complete ignoring, that there is such a thing as a standard library.

So they don't use standard string.

They use another approach for representing strings.

They don't.

Put stuff onto C out to get it onto the screen.

They use a different older approach to put characters on the screen and to read characters from the keyboard.

These approaches way harder for you to read and understand.

When you spot them you can realize that they're equivalent to these things from the standard library and again just kind of read past those very often that's all the Debugging and logging, kicking around the edges at the piece of the puzzle you're looking for.

So, interpret them.

Say, oh I get it.

This is like string.

Oh I get it.

This is putting stuff on the screen.

And here's the one line I really wanted in the middle of everything and take that goodness out of that big legacy file.

In the worst case, you have essentially C a completely different language being compiled as C++.

No classes and a number of constructs being used that literally date back to before C++ existed that were in the language from C and you end up with code that is very difficult to maintain and read.

Try to read through it.

Try to find the nugget you need in the middle and don't say to yourself, wow, this code is 25 years old and it's a classic of the field and I should write my code this way.

It is not like that.

So let's get more specific and go through some of these constructs you're likely to see.
Casting

I'll start with casting.

That's when you deliberately take some data that is of one type, it might be a built in type like integer, or double, or a type you wrote.

Like employee or transaction or account.

And you convert that to a different type.

Typically to store it in some other variable.

Here's how it could be written.

We call this round bracket casting or C style casting.

And you see a lot of it in legacy code.

It just means the exact same as this.

Both of these lines take the double 4.

9 And ask the compiler to convert it to an integer and put that integer into i and you won't get a compiler warning for doing so.

Some people then say why would I type all the extra letters in static cast? Hey you told me about static cast but you didn't tell me about this handy round bracket casting, this looks better.

It is not better.

Because I haven't talked a lot about pointers, or some of the mechanics in working with const, or some of the tricks that some really old code uses, you only know about static casting.

But there are other kinds of casts as well, sometimes people will take a chunk of memory and decide that they just want half of it to be considered as a different shorter data type.

Or they will take a huge chunk of memory the compiler is thinking of as say a double and decide the think of it as an array of integers.

What and this is called a reinterpret cast and it is something that can be done only with great care.

In the old style round bracket casting, all of the kinds of cast use the exact same syntax, the round bracket, what it is you want to make it.

Regardless of whether the conversion is something you can know about at compile time, something you can only know about at runtime, something that involves deliberately throwing away the rules of the language, something that involves converting from two completely unrelated types that have nothing to do with each other.

Some of these casts are really, really dangerous, and you can't tell, we just see the round brackets, which kind of cast it is.

Whereas you can say static cast and static cast has little siblings like dynamic cast, const cast, reinterpret cast, that speak to people who are reading your code and explain it, and that also includes some safeguards against mistakes and runtime errors.

When you see this kind of cast, do not copy it.

Just understand that that's what it means when you see a round bracket and then a type like int or transaction or an object name with some punctuation and we will talk more about what the star means there in a moment.

It means a cast.

Continue to use the right kind of cast in your code the much more searchable, much more readable, much more understandable kinds of casts in your code that you will see a lot of round bracket casting an old star code and now you know what it means when you see it.
Macros

Macros have been with us since the time of C.

And they are an instruction to the pre-processor.

Everything that starts with that number sign is an instruction to the pre-processor.

The same mechanism that includes header files into you source code as it's being complied.

And the thing about the pre-processor is it is not a compiler.

It does not understand type.

It simply substitutes in this case, one thing for another.

So here we're defining pi, cause I'm probably doing some trig, as three point one four.

And somewhere else in the code there'll be x is equal to y times pi.

And the pre-processor will just plunk three point one four in there.

So that the compiler will see x is equal to y times 3.

14, and carry on about its business.

This can sort of work.

But we have a better thing available to us in modern C++.

And that's to use a const variable that has a type.

So I can declare a double, or float or whatever type I want, called Pi.

Mark it with const and initialize it with that same value three point one four.

I can put this particular variable as a member variable of some class so that I can have math pi as opposed to perimeter institute which also happens to be the same letters so I can avoid name collisions by using a const variable.

Rather than just plain defining.

You will however, bump into these defines all the time when you're reading code.

And just understand that's all its typically doing is setting up a constant.

So you have number sign defined, the name of what it is you're defining, and then the text tool value that the preprocessor will plunk into the code everywhere that it sees that name.

Macros can also be used to make things that look like functions.

This is trying to define a function called SQR and it's very common in macros for them to be all caps.

It looks simple enough, the square of x just substitute everywhere you see that x star x.

So the square of 2 would be 2 x 2 or 4.

Fantastic.

You're probably wondering why wouldn't you write a function? And that is exactly the right thing to wonder.

You should write a function.

Some of these habits come from a time before in lining When people would worry about the cost of a function call, these days the compiler takes care of that for you.

People love to ask C++ job interview questions around macros because of the horrible things they do if you write them wrong.

That one right there is written very naively and incorrectly, and I'll show you why.

If I were to write SQR at 1 plus 1, that's not going to evaluate 1 plus 1 to be 2 and then square it to get 4.

Instead, it's just going to go, 1 plus 1, star, 1 plus 1 Because it's just textual substitutions.

But then when the compiler actually handles this expression it's going to use order of operations.

So the thing in the middle, one times one will get evaluated first, giving us one, then we will have three ones to add up, and the answer will be three.

And while this might be a little overly simplistic believe me I have seen many macros that do the wrong thing because they don't have enough brackets in them.

In order to prevent that people put a lot of brackets in their macros.

And so when you find something like this, just think of it as being a function.

If you need to copy that code and use it yourself, certainly make it a function, because with inlining it will be just as fast, and if you think, I've found another way to write a function, well you really haven't.

But you can read it like that when you find one in the old code.
C Style Arrays

Vector is a great class.

It takes care of so much of the housekeeping involved in keeping track of a bunch of somethings, while never forgetting the type of those somethings and giving you the C++ type aware mechanism.

But that programming problem, that need to have a bunch of somethings, is older than the vector class.

And there was a capability in C.

To have arrays of whatever you would like.

C style array has a type.

You can't mix and match employees and integers.

And the extent that is how many things are in the collection.

It's generally known when you compile the code.

So, this line of code int numbers declares an array of four integers numbered zero through three.

You may also see it this way.

There's nothing in the square brackets, because the entire array is now being initialized with these braces.

So, we're initializing this array of doubles.

To hold these five values, 1.

1, 2.

2, 3.

3, 4.

4, and 0.

And the compiler literally counts, and says, hey there's five numbers in the braces, so I guess this array has five elements.

The big flaw with the C style array, is that it is not an object.

And you can't ask it questions like, how many elements are in you, the way you can ask a vector.

So typically, the developer would have another variable kicking around in which you kept track of how many elements were in this array.

In fact, this is one of the uses for the define macro that I just showed you.

You would define number of numbers let's say to be four and then you could use that in your declaration of numbers.

Put it right inside the square brackets.

You could also then use it to control your for loops or whatever else you needed to do.

Sometimes instead of that you'd see a signal value so if you look at the more numbers arrayed the last element of the array is set to zero and that's so maybe you can run a loop to until you hit the zero, that kind of thing.

It's a lot of work.

When you are reading it over, you have to figure out oh, this is some sort of a collection and oh this here represents how many are in the collection.

You don't have to write it that way.

You can take the same concepts and write them with a vector.

And vector also involves the square brackets, if you want to access a particular element.

Unlike vector, c style arrays can't grow themselves.

You can't just stick another one on the end and they get bigger.

The other thing that's different with a vector and C style arrays is that especially the older code will often use pointer semantics to work with the elements of the array.

They'll get a pointer to the beginning of the array.

If the array is called numbers, if I say x is equal to number square bracket 2, I get access to that third element of the array.

But if I say that some other thing p is equal to numbers, it's actually the address or a pointer to the start of the array.

And then, a pointer work, which you don't really know how to do, can be used to iterate through that.

As someone reading it over, probably the thing that matters the most to you is seeing those square brackets, realizing oh, this is a C style array, this is a collection of thingies and I'm going to do a similar manipulation myself but with vector.

So sort of read past all the housekeeping code that's trying to keep this collection the right size or in the right order or whatever it's doing.

And focus in on the kind of heart of it and the thing you're reading this code to find out about.
C Style Strings

Probably even a harder thing to read than C Style arrays is C Style strings.

Again, just because the standard library hadn't come along and given us a nice, easy way to work with strings doesn't mean people didn't need strings in their programs.

They did, and so, there was a way to use a bunch of letters, a bunch of characters carried around as a unit in A C program and some people took that capability and started using it in their C++ programs.

Essentially it's an array of characters.

The char type represents a small number or a character like the letter a and so you make a C style array of these.

And that's your string.

And as I mentioned, with a C-style array, you can sometimes work with it using pointers and the star symbol represents something being a pointer.

So you'll often hear people say char star.

I think we like it because it rhymes, for one thing.

Say it's a char star string.

We'll also say it's a C-style string.

And remember that a C style array does not know how long it is.

If you want to be able to pass around a single thing to represent a string, how are you going to do the length? Well, they would do it by having a signal element at the end.

The number 0, represented as a character To type that in your code, you would type a single quote, and then backslash zero, and then a single quote.

Which is not the same as single quote zero single quote.

Zero in the ASCII representation has a numerical value.

That a has a numerical value, b has a numerical value, capital A has a different numerical value, and zero has a numerical value, and none of those guys have the numerical value of 0.

So, backslash 0 was really no, you know, the number 0 represented as a character, and this, at the end of the string Sometimes called the null terminator meant the end of the string.

So if you wanted to make a string that was four letters long, you would actually have to make an array of characters that was five letters long.

The fifth being the null terminator.

And if you read through old code that works with C Style Strings, you'll see an awful lot of plus one in the calculations.

And that's adding room For the null terminator.

It's complicated, it's hard to read, but when you see either car star or car and the square brackets you're realizing aw, this is a string, I get it.

And then you see the gyrations that developers of old had to go through to work with those strings Instead of the member functions of standard string that you learned about, there are these free functions, that are not member functions of anything.

That take a string as a parameter, a null terminated array of characters as a parameter.

And work with them.

So this is a function called strlen, that returns the length of the string.

And the way that it works is it just goes from the address that is the representing the start of the string, goes through each and every character of the string looking at it until it hits that numeric zero and says aha here's the end of the string and it was counting.

And then it returns back the number.

It's not the fastest thing in the world especially if it's a really long string, but it works.

Then there's strcpy.

That copies one string into another string or strcat which glues two strings together.

Their names are a little opaque, and they're not the safest functions.

If you haven't set aside a big enough string to put answers into you can accidentally write over the null terminator and this is actually the core of some security flaws and attacks.

When you read this code You will see, again, a ton of housekeeping, a ton of checking to see if there is a null terminator, a ton of checking to see if we've gone too far, all of which would just fall away if you were using a standard string.

Now that's fine, you can sort of ignore that and read through for the core of what you want.

Now there is one little funny holdover as a result of this legacy.

When you actually type quote hello quote in double quotes like that, what the compiler does is set up a C style string.

An array of characters with an old terminator at the end.

In fact, some of the error messages that you get when you try to do things involving these coded literal strings will actually mention character arrays, not standard strengths.

Because quote hollow quote is not a standard strength.

Now, when you say standard string s is equal to "Hello, " the conversion from the char star string, using that to construct the standard string, is one of the capabilities of standard string.

So, you're fine.

There's, also, a member function of standard string called c_str.

It's a function.

That returns a char star string, that's the exact same as the contents of the standard string you're working with.

You may find other people's string code pretty opaque, pretty hard to read.

But I'm hoping that you will not need to really et all of it.

Oh, there's a char star, or, there's a, a char and some square brackets.

I get it.

This is a string, and we're manipulating the string somehow.

I'm going to go manipulate the string with standard string, have a much easier time with it.

Or you may just see calls to these str functions, strlen, strcpy, strcat, and, and many more.

A strcmp to compare strings.

When you see these, you understand you're working with strings.

You're going to try to focus on what it looks like it's doing overall.

Try to focus on the Thing you can in there to learn about.

Do not try to understand the way that c style strings got worked with.

Because life is just so much simpler with standard string.
Printf

Another problem we've always had, how do I get some output? To show people what's going on inside my program.

To tell them the answer, or to give some logging or debugging information as execution continues.

Think of all those uses of cOut in the demos throughout this course.

What did people use before? Well again, in C, there was a way, specifically, Printf.

It stands for print with format.

Some people think it means print to a file.

It does not.

There's a fprintf if you want to print to a file.

And the first parameter to a call to printf is known as a format string.

And the format string is a mixture Of things you actually want to appear on the screen and placeholders.

I'm going to read this collection of printfs to you, not so that you can go and write one, but so that you aren't freaked out when you bump into one.

Let's take these line by line.

the first one says printf, double quote, percent s So that means a string.

The round brackets will just literally appear on the screen as will the word called.

Then we have a backslash n, that stands for new line it's a line break, so we'll now move down to the next line.

Base address will then appear on the screen along with the colon, the space nad a zero x.

Then it says percent o, 8, x.

That's going to format out an eight-digit, counting leading zeros, hex number.

Then there's another \n, so there'll be another line feed.

The last two parameters that are passed into printf are symbol name and base address.

Let's say that symbol name is Open and base addresses one, two, three, four.

This would print out open and then the brackets, called, then on the next line it would say, base address zero X zero zero zero one two three four.

And that would be a line of output.

The middle call to print X says return address 0x and then again the placeholder %08x\n and then the whatever return address is.

So this is some kind of logging.

Right? Finally it says in file %s brackets line %d \n \n and the last two parameters here are file name and line number.

So this can say in file, you know open.

cpp, line 34.

%d, stands for decimal, it means an integer, you can go online and find what all these, %d, %, %x, and what not mean, but you can pretty much ignore them, to be fair.

You'll see these as debugging, as logging, as sort of informational output.

Or if it's a sample, like the little demos we've done in this course where it does the calculations and prints out the answer.

What you really need to do when you bump into this stuff, take a deep breath.

Don't let all the weird percent signs and back slash ends and what not Punctuation forest happening here.

Don't let it freak you out.

Say to yourself, I get it, we are putting some characters on the screen.

We are going to print out called, and base address and return address and file and line and then there's going to be strings and numbers put in there.

That's fine.

I get it.

You can even use your understanding of printf To really understand what the variables are, what symbol name is, what base address is, what return address is and so on, because you can see them being spoken to with those place holders.

And the place holders are always strictly in order.

So the percent S in that first one where it says percent s open bracket closed bracket Will mean symbol name, because that's the first parameter the format strength.

Then the %08x at the end of that line will mean base address.

Because they come out in that strict order.

Print out statements despite being pretty opaque are often in a way the only commenting some code has Because it's connecting words like this is what was called, this is its base address, this is its return address, this is the file, this is the line, to the variables and believe me, if those variables were called sn instead of symbol name and ba instead of base address, you would really be grateful for this little bit of documentation in the form of these printf statements.

You don't want to use printf in your apps.

What you don't see here is that are bugs and weirdnesses that are called by getting these format strings wrong.

If you pass in the wrong format string, you can get completely erroneous outputs.

You want to use standard c out, but you want to be able to read printfs so that you know what the heck is going on in that legacy code you're trying to understand.
Typedef

When you're reading through old code, it's really helpful to use an IDE like Visual Studio that will help you out if you hover over things and let you know what their types are and so on.

because a lot of things are masked through definitions and macros.

That can also be masked by something called a typedef.

A typedef allows you to setup a synonym that looks like a type, but is really just a name for an old type.

So, you might see a line like this; typedef int bool.

There was a time when the bool, all lowercase, type that could only hold true or false, didn't exist in C++.

And there is code that goes back that far, and this all caps BOOL, it's an integer, and then by Good behavior developers only ever put the values of zero and one into it.

Now you read a typedef the same way you read a variable declaration.

You know how you might write int I, I is an integer.

So you write typedef boule, it means boule is a typedef for So, bool's the new name, and it's being defined to mean the same as the old name.

Now there are a lot of reasons why you might use a typedef, and it's not always obvious to you when you come across it.

Sometimes, there's a portability theory.

Really have to say in theory because it turned out a lot of this didn't work very well when the time came to actually implement it as we changed our operating systems.

You know C and C plus, plus are languages which first were born on very, very different operating systems then what we use today.

And when we transitioned from 8 bits to 16 bits, from 16 bits to 32 bits, and now we're going through the 32 to 64 bit transition, in theory, you could've had a type that meant, 32 bit something or another, and have that, oh my gosh, now it's 64 bits because we've changed to a different operating system, and we could've used toms typedefs and changed them around And had all our code continue to use our typedef name, and just change one line that said, that's not this instead of that.

You may come across things, for example, that seem to do nothing more than change the case.

You'll see typedef, lowercase long, uppercase long, capital L, capital O, capital N, capital G.

What the heck, well you will see on some other operating system all caps long might be typedf to something slightly different and it all still work as long as we just say capitals long ultra are code.

The fact that it didn't really work is not your problem when you are reading the code right.

you are reading the code, why do we typedef long to long.

Well it was this hope about portability, don't worry about it you need to understand what you see when you are looking at those types.

Other times there was I think pretty good motivation, which is you know I have a lot of different integers in this world.

If I'm writing in a language that doesn't yet have the bool keyword I might have integer value 0 or 1 to represent false and true respectively.

I might have an integer which is how big something is.

There are ten elements in this collection.

I might have a different integer which sort of represents my position in that collection and I might decide to set up Three four five typedefs that are all typedefed to int, but I will call them size.

And you'll sometimes see underscore T, when people are doing this.

Stands for type.

So size underscore T, position underscore T, that kind of thing.

To give you more ways of expressing yourself than just integer.

And then, sometimes they're just so you don't have to type so much.

Sometimes it's so you don't have to type angle brackets.

Someone who was scared by an angle bracket as a small child.

This block of code sets up a typedef which says VectorOfInt, like spelled out as words Is when I say that, what I mean is standard, colon, colon, vector, ankle bracket, int, ankle bracket.

Then you can say vector of int numbers.

Similarly, you can set up a vector of double standard, colon, colon, vector, ankle bracket, double, ankle bracket.

Then when I say vector of double, that's what I mean.

This is less needed these days because of things like auto, but It still has its place.

Now what really matters to you when you're reading the code.

Don't try and get into the person's head and understand why they did it.

Just understand when you see a type def that they're making up a new name for an existing type.

What really matters of course is what gets done with that thing once it's been declared using the type def.

Just don't be intimidated by, what is this another way to declare your own types I understand about Class, but what the heck is typedef? Well, it's basically just synonyms.
Pointers

Pointers, I've bumped across them throughout this course.

There's another way but it involves pointers and I don't want to talk about pointers yet.

I'm still not really going to talk about pointers.

I'm going to show you how to spot pointer work in old code.

You're going to have to learn, eventually, how pointers work in C plus plus.

In order to get certain things done, you still need to use them.

But let's focus on how to read somebody else's code.

You know, people joke about all the different punctuation in C++, and much of it does relate in fact to pointers.

And position matters.

So if you are declaring something and there is a star in that declaration, that means you are declaring a pointer.

int star space pi semicolon means that pi is a pointer to an integer.

And so does int space star pi.

They both mean the same thing.

It doesn't matter where the spaces are.

In fact, you can say int space star space pi if you want to, whatever floats your boat.

I slightly prefer the first style.

You'll read lots and lots of code that the first and second style, no difference.

In both of these cases, pi is not an integer, it's a pointer to an integer.

The ampersand before a variable means address of You may remember that, in declaring the parameter types for a function, ampersand after a type meant I'm taking this parameter by reference.

But this is ampersand before a variable.

So if I set up some integer j and give it a value like four, It's perfectly legitimate to say PI is equal to the address of J.

Whenever I give this kind of pointer example, I always have to stop and point out that this is kind of a dumb example.

I mean I've got J sitting right there, I don't really need it's address What really happens with pointers is that you pass them off to functions, which then turn around and use them, or you do some pointer arithmetic with them, so this next little bit of example is overly trivial, but it's there just so that you can see the syntax.

Many people don't get what the address of does, and when they're trying to write code with pointers they run around putting stars and address of symbols into the code until the compiler stops yelling at them.

And they actually really understand what they are doing.

So the address of J is what goes into P I, because it is a pointer too.

When you have a pointer and you put a star before its name that's the opposite of address of or content of.

It means go to that address and give me what's there.

So *pi refers to the contents of that pointer pi and since line before this in the slide I set PIZ0.

pi to the address of j.

The contents of pi is the same as j.

If I go and look at that value I'll get the value of j.

If I change that value as I am doing here, star pi is equal to three, I'll actually change the value in j.

And again what this is really about is storing just a pointer.

In a variable, and then later using that pointer to change the value, when you may not even have access to the original variable anymore.

The other thing that people do with pointers is they increment them.

The plus plus operator, if you have an integer i, and you say i plus plus it goes up by one integer.

If you have a something pointer p something and you plus plus it.

It goes up by the size of a something.

So that if you had a number of somethings in a row, it would be pointing to the next one now.

And the number one place you'll see that done is with an array of somethings.

So someone will grab a pointer to the beginning of the array and use the plus plus operator to go through all of the elements in the array, one at a time.

Our last piece of punctuation, sometimes this is called the arrow operator.

I mentioned this under miscellaneous punctuation in another module You get it on your keyboard.

You type a minus and then a greater than.

And it's just the same as taking that pointer using star on it to get to its contents, which is some kind of an object, and then using dot to call a member function for that object.

Because of some oddities about the order of operations in C plus plus.

If you wanted to use that combination of star and dot you would need brackets.

You need to say brackets, star pointer, and brackets so that that happens first.

That gives you an object that you could call dot on.

Basically the arrow operator is just saving you typing.

So if you have some pointer to a transaction called pt, you could go pt arrow report, and it would call the report member function of whatever transaction that pointer is pointing to.

I bet it's not a surprise to you that pointer arithmetic is a rich source of bugs in old and new programs alike.

If you see some code that's incrementing pointers to say go through an array you are going to want to use a four loop to go through a vector.

If you see some code that's incrementing pointers to access each character in a string one at a time to check something, you are going to want to use.

A standard library function, to do that same finding, or searching, or replacing, or whatever's happening in that string.

You don't want to take this code and just use it because it's going to be complicated and difficult and it's probably going to have bugs in it.

I sometimes come in as a consultant, and fix code like this.

And when I see tons of pointer arithmetic, I gets a huge winds.

I can take 200 lines of code that nobody dares to touch because it's so scary.

And turn it into 50 lines of code that's perfectly readable, understandable, and maintainable.

Because I just used a standard library which has been invented since that code was written.

When you come across code that's full of punctuation, stars and ampersands everywhere, and arrows, and dots, it's probably pointer code.

That's what all the stars and ampersands and arrows are about.

You can read it, and you can translate it in your head.

But do not copy it.

Do it over.

Using things you know how to do.

One other thing.

The keyword new.

You'll see something *x equals new blah blah blah.

That's the free store.

Now the free store is still a perfectly valid use of pointers.

You're going to want to use the shared pointer and unique pointer that come in C++ 11 because of the capabilities they give you around automatic memory management.

The standard library now includes these so that you don't have to do all the work by hand, but you are going to have to learn about the free store if the code you're reading has new in it.

That's slightly harder than if the pointers are only being used to work with arrays.
Summary

Finding code on the internet, it might be great, it might not be so great.

Finding code in old books or old articles.

It might be the only example you can find for some particular part of the operating system that you need to call.

But, it sure can be hard to read.

These old constructs, many of which came over from C, can be a little opaque.

They are not as expressive, they are not as easily understandable as modern C++.

And if you just copy that code instead of going through changing x to y, and think you've got most of it, you may be introducing bugs.

The best way to use old code is to read it Understand it and then write your own equivalent.

So you read it through and you say, all these print F statements are like debugging output.

Okay, that's great.

I'm not going to use print F, I'm going to use C out.

Or I'm not even going to have any debugging output.

But I'm reading the print F statements and it's helping me to understand.

What each variable actually holds.

Great.

I'm reading through this other stuff.

Oh look at these strings wow, there's all these stirrup functions, so this is the length and this is comparing that string to that string.

And this is copying some characters onto the end of that string.

And this is going through, okay I get it.

Now I'm going to do the same thing using standard string.

Or, hm, this seems to be an array of employees.

And we're using some pointers and we're iterating through from the first employee, checking each ones name.

Using strcmp to compare the names.

And if we find the name, I get it, okay.

Now, write it your way.

In fact, when people tell you C++ is difficult, you read enough old C++ code, 10 year old, 15 year old, 20 year old C++ code, you're, you going to find yourself agreeing with them.

But that's then.

This is now.

You don't have to write that kind of code.

You're not going to use C style arrays, you're going to use vector.

You're not going to use C style strength, you're going to use standard strength.

You're not going to use print F you're going to use the C out from the stamp library.

You're not going use type def you're going to set up your own classes if you need them or just use the types that come with the language.

You're probably not going to launch into using pointers as ways to get through collections, because we have much better ways to iterate through collections now.

The kind of C++ I've shown you in this course and that I cover in my other, more advanced C++ courses is all safe and sane and readable and maintainable and much easier.

So, kind of fight your way through that old code to get to the core where you say, oh, this is the Windows API function that I need to call to, I don't know, delete a file.

Excellent.

And then, ignore everything that's around it and write that yourself using a more modern style.

Or frankly, say to yourself this sample is from the Jurassic era, and I am going to look for a different example with modern C++ in it.

I wish I could tell that all of the current documentation out there in the universe is modern, but it sure as heck isn't.

There are all kinds of vendors, I am going to mention windows API, but believe it's true across platforms, there are all kinds of vendors that say well we have a sample The fact that it looks like it was written in 1402 doesn't bother them.

They say they have a sample, and it might be horrible style, essentially CB and compile with C++ compiler.

No templates, no modern automatic memory management.

Just hard to read, hard to understand, but hey, we have a sample, so we're done.

But if you can, find an example with more modern code.

Your life will be a little easier.

It's difficult as a beginner to sometimes choose to blame the other.

You always think it's your fault.

So you find the sample like wow I can't, I can't read this.

It's so complicated what are all these STR functions for? And then you think that's a problem with you.

It's a problem with the sample.

They should write a sample from the twenty-first century.

if you can't.

If you have to use the old legacy code to understand what your trying to understand, focus on the little gems amongst all the housekeeping, and amongst all the old school stuff, and really learn that, take that, go write modern nice codes yourself.

That's something you can do now.

