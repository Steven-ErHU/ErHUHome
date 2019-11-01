# .NET Internals and Advanced Debugging Techniques

## Author 

Mario Hewardt

## CLR Internals

### Introduction and Overview

Hi, I'm Mario Hewardt, and I welcome you to the first module of the Advanced .NET Debugging course.

In the first module, we're going to be taking kind of a whirlwind(快速的) tour of the CLR Internals.
在第一个模块，我们将快速浏览下CLR的内部。

So what we're going to be covering, we're going to be peeling(去皮) the .NET onion.
所以我们要涵盖的内容就是给.NET解剖。

We're going to start at a very, very high level, take a look at what the CLR looks like in general, how it operates, and then we're going to slowly just keep peeling it until we really get down to the core of it.
我们将从宏观上来看下CLR是什么样的，它是如何运作的，然后我们再慢慢地的深入直到进入他的核心。

One key thing is that what you learn in this course is going to be applicable to all the .NET technologies.
关键的是在该课程中你将学到的知识可以应用到所有的.NET技术中。

Because we're looking at the core, at CLR itself, all the auxiliary(辅助的) frameworks around it like WCF, WPF, they all run on top of this same core, so what you learn here, as far as the internals and the debugging is concerned, you can then easily use when you debug different kinds of .NET applications.
由于我们看的是核心，CLR本身，所有围绕它的辅助框架，比如WCF，WPF，都是运行在这同一个核心上，因此你学到的，包括CLR本质以及涉及到的调试，都可以很容易地应用到不同的.NET应用程序调试中去。

The last thing, logistically, don't worry about the tools in this particular module, we're going to be running a lot of demos here to kind of show you, not just talk about the CLR, but show you what it looks like, what the state of the CLR looks like in the debuggers, but what I want you to focus on is more the concepts, and not the tools or what commands are being run, etc.
最后，不要顾虑这个模块用到的工具，我们将运行许多示例程序，来讨论CLR，以及展示它是什么样的，在调试器中它是什么样的状态，但是我想让你关注于概念，而不是工具以及运行的命令等等。

The next module in this course is dedicated to introducing you to the tools, the debuggers, and also all the commands that we're going to be using in subsequent modules.
下一个模块目的是想你介绍各种工具，各种调试器，以及所有在接下去模块用到的命令

So we'll start with an introduction and overview of the CLR.
所以我们将开始介绍和概述CLR。

We'll talk about the CLR process, and by process I mean the physical process, the binaries, when a .NET application is run what actually happens.
我们将讨论CLR过程，过程指物理过程，二进制文件，当.NET应用程序运行的时候发生了什么。

Then we'll start digging in a little bit.
然后我们将再深入探讨一些内容。

We'll talk about application domains which are kind of isolation boundaries between different applications.
我们将讨论应用程序域，这是一种不同应用间的独立边界。

We'll talk about assemblies themselves, they're kind of the basic deployment unit of .NET code.
我们将讨论程序集，他们是.NET代码的基本部署单元。

Types, we'll start with value types, we'll talk about reference types, and as I mentioned before, there's going to be lots and lots of demos so that you can get a good feel of what a CLR state looks like.
类型，我们将讨论值类型，引用类型，正如我提到的，将会有很多的示例来让你体会CLR状态是什么样的。


So let's start with the overview.
所以让我们从概述开始。

.NET is really nothing than a __virtual runtime environment__, and a in Microsoft's case, or .NET, it's referred to, or it's called, the __Common Language Runtime__, also shortened simply by saying the CLR.
.NET 是一个虚拟运行环境，在Windows下，或者.NET，它是 公共语言运行时，简称CLR。

It does support a number of languages, such as C#, VB.
它支持一些语言，比如C#，VB。

We also have the managed C++, IronPython, IronRuby.
我们还有托管的C++，IronPython, IronRuby。

The interesting part about a virtual runtime environment such as the CLR is when, if we take the Hello World example and we're writing that in C++ and we're writing it in Visual C++, so it's not targeting .NET, it's the typical standard Hello World C++ application, when you compile that, what ends up coming out is an executable that, amongst other things, contains the machine code, that the processor knows how to run and you get the Hello World output that you expect.
关于虚拟运行环境比如CLR，有趣的是当我们写Hello World示例时，我们使用C++，使用 Visual C++，目标不是.NET，它是一个典型的标准C++应用，当你编译它时，会得到一个可执行文件，包含了机器码，处理器知道如何运行它，你能够得到期望的 Hello World 输出。

With a virtual runtime environment, CLR specifically, it's a little different, because once you compile your code, say that you wrote the Hello World in C#, what comes out is also an executable.
在虚拟运行环境中，具体来说，CLR，它是不同的，因为当你编译你的代码，说你用C#写了Hello World，你得到的也是一个可执行文件。

It's known as an assembly, which we'll talk more about later, and inside of there is also the code, but the code is not machine code, it's actually a different representation that the CLR then interprets at runtime and translates into machine code.
这是程序集，里面同样包含了代码，但是不是机器码，事实上是一种不同的表示，CLR之后会在运行时解析并翻译成机器码。

So any language, as long as you adhere to the standard specification of the CLR, you could create any language, period, and make it .NET compliant.
因此任何语言，只要你依赖于CLR标准规范，你就能使其在.NET下兼容。

The language that the .NET runtime, or the CLR, understands, it's known as the Microsoft Intermediate Language or just IL for short.
能够被 .NET 运行时，或者 CLR， 理解的语言，就是微软中间语言，简称IL。

Now the CLR provides a lot of benefits.
现在 CLR一共了许多的好处。

One is obviously the one that a lot of people talk about, automatic memory management, AKA the Garbage Collector.
其中之一就是许多人们讨论的，自动内存管理，亦称 垃圾回收器。

It's a very, very neat feature that allows you to not have to worry so much about memory as you do back in the native world where you have to allocate, make sure you're free and all these things.
这是非常非常有条理的功能，允许你不用像在原生世界中那样那么操心内存，不得不分配内存，确保释放了所有的东西。

The Garbage Collector just kind of auto-magically takes care of that.
垃圾回收期知识一种自动魔法替你关心这些。

It's a very common area to get into trouble with when it comes to garbage collection, so I have an entirely separate module on this in this course that will talk about the common pitfalls(陷阱) of that.
当涉及到垃圾回收，这是很容易陷入麻烦的区域，所以我们有一整个单独的模块，讨论常见的陷阱。

Other benefits include rich security subsystem, code verification, and much, much more.
其他好处包括丰富的安全子系统，代码校验，很多很多。

So at the 100, 000-foot level, deep inside you have something known as the __ECMA__, or ECMA Common Language Infrastructure.
因此在非常底层，有一个叫做的 ECMA 的东西，或者 ECMA 通用语言基础。

What this is, is simply just a specification.
这是什么呢，就是一个标准。

There's no code or executable, it's just a spec that states what every single runtime that wants to be compatible with Microsoft's Common common Language Infrastructure, what it needs to do and what it needs to adhere to.
没有代码和可执行文件，只是一个标准，声明了每种运行时想要与微软通用语言基础兼容，所需要做的，以及需要遵循的。

On top of that, you have the Common Language Runtime itself, the CLR, that's Microsoft's implementation of its own Common Language Infrastructure spec.
在这个基础上，你才有通用语言运行时，CLR，这是微软对其通用语言基础标准的实现。

There are other implementations of that spec out there, Mono is one of them, so you can definitely find other implementation besides Microsoft's, although Microsoft's obviously is kind of the most common one.
还有其他的实现，比如Mono， 因此除去微软的，尽管微软的实现是最常用的版本，你完全可以找到其他实现版本。

Now the runtime itself is great, because now you could in theory write some application that would execute in the runtime, but to make life easier, Microsoft also provides a bunch of .NET frameworks so that things like making web service calls or exposing web services, they're kind of wrapper libraries to make that a whole lot easier, and that .NET framework just kind of sits on top of the Common Language Runtime.

Examples of that is WCF, WPF, Entity Framework, etc.

And then lastly, on top of the actual framework you've got all the .NET applications.

This would be your applications that you develop, that use the frameworks, which in turn uses Common Language Runtime that is implemented by adhering to the Common Language Infrastructure specification.

So what does the execution process look like for a .NET application? Say you wrote the Hello World in C#.

Start with your source code, feed it through the compiler, pretty straightforward, nothing is really changed here in as far as writing for .NET or writing native code.

The compiler spits out a binary, in this case it's a .NET assembly.

In the case of the native world it's a exe of some sort.

The assembly gets loaded by the CLR, and the CLR has a component know as the Just In Time compiler, or JIT for short.

The Just In Time compiler looks at the assembly, which contains this Microsoft Intermediate Language, starts at runtime translating that intermediate language into machine code, and instructs the processor to execute that, and then the application finishes.

So really the big difference between native and managed code here is this CLR piece and the Just In Time compiler.


### Loading CLR Images

Now that we have built a .NET application or an assembly, if you will, what happens when the operating system tries to actually execute that? Well to make that a little bit easier to understand, let's talk about native code first, so my C++ native code Hello World application.

Windows uses a binary format that contains the data about the executable that you're trying to run, and when it encounters an execution of that application, it kind of knows where to go within this file to bootstrap the application launch process, so that's how it works at a high level on the native side.

Well it turns out that for .NET it works very similarly.

It uses the same __portable executable file__ format or __PE__ file format for short, and that's been around for a long, long time.

It includes metadata about the image.

One of the key pieces of metadata is an attribute known as a StartAddress.

In the native world, the StartAddress would typically point to some sort of main function in your application, and that's typically the C Runtime's main, which eventually will call into your main function and your application runs.

Well, for .NET it's a little different.

The StartAddress actually points to a binary known as mscoree.dll, and that resides in your system32 folder.

mscoree's responsibility is to initialize the right version of the CLR.

Once it knows the right version, it can then go ahead and load and initialize it.

One thing I want to bring up here, is as you probably know, .NET has the notion of being able to host multiple versions of .NET or the CLR on the same machine, so you can have CLR 1.0, 1.1, 2.0, and 4.0, on the same box, and they all have their own separate binaries, both for the frameworks and the CLR itself.

The one thing that will never change, or rather, is always kind of backwards compatible, you will only ever have one version of this DLL, is the mscoree.dll.

Because really all that it does is it looks at the assembly that is being loaded and it says, hey, you know, what version of the .NET framework was this assembly targeting? Let's say it was 2.0.

Well now it then knows how to go about finding the CLR 2.0, initialize it, and then run your application.

On Windows 2000, the image, or the assembly, contains a JMP instruction to _CORExeMain.

That was required because .NET 1.0 shipped after Windows 2000 shipped, and you had to play some tricks to make the load process work.

On Windows XP and higher, the Windows loader was modified to "know" about the CLR, so the JMP instruction was no longer necessary.


### CLR Process Overview

So now that we know how the CLR gets initialized when your application runs and how your application itself is then subsequently launched or bootstrapped, let's talk about what the CLR process looks like in memory.

So the big rectangle here simply represents an instance of your application running on any given machine.

At a high level, the process is broken down into application domains, and they can be 1 or more.

An Application Domain can be best thought of as a way to create isolation boundaries between different pieces of code running in your app.

So I could have a piece of code running in application domain 1 and a piece of code running in application domain 2, and in theory the CLR guarantees that these are isolated so one application can't step on the toes of the other application.

As a matter of fact, you can define policies around each application domain and also control who is actually allowed to call you from the other application domains.

Each application domain really is just a container for one or more assemblies.

We'll talk more about those later, but assemblies typically just host your code.

Again, when you build your application, send it through the compiler, out comes an assembly, and that's the one that gets loaded in the application domain.

The code itself is typically represented as types, so in C#, for example, if I had a class called Employee, well that's a type, and that will be housed within an assembly.

There's one hidden concept in here known as a module.

It's not something that you usually work with directly as developers, but if you wanted to view the module itself, it would be right around the types themselves, so the types would be housed in modules, and each assembly then contains one or more modules.

So, like I said, though, it's not something that you typically need to concern yourself with, but just an FYI, it's there.

### Application Domains

Let's drill down a little bit more into application domains.

Like I alluded to(提到) earlier, it's an isolation boundary within one of the same process, and it improves the stability and reliability of .NET applications.

You can define security policies between application domains, such that I only allow certain pieces of code, perhaps, running in other app domains to make calls into mine, so that improves stability.

Objects instantiated or defined in application domain 1 can't be directly used by application domain 2, so I couldn't just pass a reference over to code running in app domain 2, because that would actually fault this CLR we're trapped at, so what you have to do with these objects is you have to actually explicitly marshal objects across app domains, so that's another form of isolation boundary.

and there's also other general classes of bugs that application domains aim to solve.

It's often transparent to developers, so when you write your .NET Hello World application, you don't have to go in and explicitly create an application domain that your code will run in, that's something that happens underneath the covers for you automatically.

Now there are times when you may choose to, yourself, create application domains, and IIS is an example of that.

In an IIS worker process, you may, in fact, have x number of applications running, or services, whether they be WCF or ASP .NET.

And you can actually configure IIS such that for every application that's loaded into this one worker process, that you want it to run in a separate app domain, and there's also some other configuration options around how you want to configure the app domain specifically.

So if you were, for example, to write an infrastructure that allowed you to host x number of applications, and you don't know what those applications are, you're really just a host, it might be a good idea to design your host so that each of these applications run in independent application domains, just to increase the stability.

One thing that I do want to mention, I've used the word isolation boundary, and the word in theory.

If the code that's being executed in an application domain is running within the confines of the CLR or .NET only, and barring any bugs in the CLR itself, the CLR will place these isolation guarantees on your code.

However, there are times when we as developers in the .NET world have to resort to interopping or doing interoperability with native code, whether that be through COM or Platform Invoke.

In those cases, your code leaves the boundaries of the CLR and goes into native code, and CLR has no control over what that native code is doing.

In those cases, all bets are off.

If you have, for example, a memory corruption, well, if your native code or that piece of native code could corrupt memory in a different application domain, so that's just something to keep in mind.

The CLR always creates three application domains for you.

There's the system application domain, the shared application domain, and then the default application domain.

The system application domain is responsible to create the shared application domain and the default application domain, so you can view that one as kind of a bootstrapper for the remaining two app domains.

It also loads mscorlib.dll.

mscorlib contains a set of base functionality for .NET applications to run, and so the system application domain ensures that that gets loaded.

Now one critical thing here is that mscorlib.dll does not get loaded into the system application domain, rather, system application domain loads it into the shared application domain.

And then it also contains some auxiliary domain book keeping data, as well as contains the string literals.

It also pre-creates exception instances, and this is a topic that actually gets people quite often.

When the CLR runs, the system application domain will create three instances of exceptions, and it's the fatal engine execution exception, it's the StackOverflow exception, and the out-of-memory exception.

So if you're debugging an application and you think that, hey, you know what, I think the application has some problems with memory, let me see if there is an out-of-memory exception recorded, and so you go through the process of dumping out all the exceptions, and you'll notice in fact there is an out-of-memory exception instance.

Usually the engineer will then say, well, it ran out of memory, I just don't know where.

Well that can actually be wrong, because that out-of-memory exception instance will always be there regardless of if an out-of-memory has occurred or not.

And the reason for that is actually pretty straightforward.

If an out-of-memory does occur, in order to raise the out-of-memory exception, a new instance of that exception has to be allocated.

Well if you're out of memory to begin with, chances are you're not going to succeed creating that instance, and that is the reason why the CLR pre-creates it.

Now the shared application domain, it contains the mscorlib.dll, which is the library or the assembly that the system application domain created.

It contains basic types such as strings, enums, arrays, etc., and it contains non-user mode code.

The key thing behind the shared application domain is that for really, really truly common types of frameworks, you don't want to load it into every single application domain that might need it.

Instead you want to kind of have it in the special app domain and then everyone can reuse it.

That is what the shared app domain is there for, however, it's strictly controlled by the CLR, you can't inject your own code into the shared application domain.

The only way that it's possible is if you host the CLR yourself, and that's a topic we're not going to get into here, but you can, in fact, by using the COM interfaces, host the CLR and then you control a lot of aspects of how the CLR runs, and one of the aspects is being able to put other things into the shared application domain.

Now lastly the default app domain.

That gets also created for you automatically.

That's where all your code goes.

So in the Hello World application, that's where your assembly gets loaded.

The resources that are associated with an assembly loaded in the default app domain, are only valid within that application domain.

### Demo - Looking at application domains

Let's do a quick demo here so we can see what the application domains look like on an actual .NET application running, and we're going to use the debuggers to get that information.

I want to again reiterate(重申), focus on the concepts here and not so much the tool or the commands that I'm running.

We'll be covering those in detail in the next module.

The app that I'm going to run is really probably the most simple application that you can run.

It's a console-based app and really has one line of code, which is a write line of Welcome to Advanced .NET Debugging! Let me run this under the debugger, so now the application has run.

It's output is Welcome to Advanced .NET Debugging.

If I break into the debugger and I load a magical extension, which we'll be using continuously throughout this course, and I want to take a look at the application domains in the application that we're running right now.

So I'll use! DumpDomain, and what it does, it outputs all of the app domains as we expect.

The first one that we see is the system application domain, and it gives you the address to where that application domain is located.

Now you can use this address, and we'll see that later on, and kind of pass it to a different command to get more information.

So that's the system app domain.

We expect that to be there for all applications.

It gives you some other information here like LowFrequencyHeap and HighFrequencyHeap.

These additional properties you don't have to worry about because they're mostly internal data structures to the CLR itself.

We've got the shared application domain, we expect that to be there as well, and then we've got Domain 1.

Now this is the default application domain, this is where all of your code should be running and should be executing.

And we'll see that it also enumerates, on a per app domain basis, all the assemblies that are loaded in it, and one of the assemblies that we can see is 02Simple.exe, which is our application that we're running.

And then it also tells you the modules that are part of that assembly, remember the module construct is kind of a hidden construct, you don't see it necessarily when you're developing on a day-to-day basis, but it's there nonetheless, and we see that the module is 02Simple.exe.

So this command can give you really kind of good overview of how many applications domains are in there, you can look at each of the application domains, see which assemblies are running, and that can kind of tell you where different bits and pieces of your code are actually located and running.

If I was to run this command on an IIS worker process that was hosting 15 separate apps, say they're WCF Services, I would have domain 1 through 15 being listed here because they would each be running in their application domain.

If you wanted to get just data on a specific application domain, you can take the address of it and then just feed it into the DumpDomain command.

So DumpDomain by itself with just list all of them, and DumpDomain with an address will give you information for just that domain.

### Assemblies

Now that we've covered application domains, we know that they're really just __high level containers for assemblies__.

So let's talk about assemblies in a little bit more detail and kind of continue peeling this onion here.

They are the primary building block of "code" in .NET.

When you send your code through the compiler, out comes an assembly in the form of a .exe or .dll.

They are also the primary deployment unit, so when you ship your application, you're going to be shipping one or more assemblies.

__Assemblies are self describing.__

This is a very, very important concept.

In the native world, so if you have a native code application and you're looking at how that application executes and the state of that application and the debuggers, there is not a whole lot of auxiliary data, short of the private symbols that will tell you what it is that you're looking at.

Well the .NET world is very different, because the assemblies are self describing, and you can use some really, really cool commands to get very, very detailed information about what is the state of this application and more useful, what are the different types of objects that are loaded, how many instances of them or the sizes of them, and things like that.

So this is a really, really powerful concept in .NET.

__Assemblies can contain one or more modules.__

Again, I want to reiterate that this is not something that you will commonly come across.

A module is going to be automatically created for you, so it's not something that you would explicitly do, but just as an FYI that it can contain one or more of those modules.

There are two different types of assemblies.

There are private assemblies and there are shared assemblies, and we'll talk a little bit about that later.

Just to give you an idea about the relationship between assemblies and modules, the left-hand side here, I have an assembly, and it's a single-file assembly.

It can contain one or more modules, this is where your code is located.

And every assembly also contains what's known as a manifest, and really the manifest just is some auxiliary metadata about what's in the assembly itself.

This is the most common scenario that you'll have.

Now if you wanted to, you can change that picture a little bit and you'll get an example of that on the right-hand side here, and this is referred to as a multi-file assembly.

And really, the only thing that's changed is I've yanked out each of the modules out of the assembly and the only thing that's left in the assembly itself is the manifest, so no code, no resources, nothing like that.

Well then the question is, where are these other modules, how can you actually execute any code if it's not part of the assembly? Well the answer is that the modules can be located anywhere.

They can be in the same folder as the now "empty" assembly, or it can even be out on the internet.

Why you would want to do something like this? An example would be if you write an application and there is a piece of functionality in that application that's very rarely, if ever, used.

Well if you want to avoid the hit of bringing in the code for that functionality, if it resides in its own module, you can basically delay that.

You take it out of the assembly, put it somewhere, and tell the assembly, if you ever need to use this then go and fetch it at runtime and load it only then, so it's kind of an optimization technique.

Again, this is not something that you'll see very commonly, but I do want to make sure that you know that this concept does exist.

So we've got shared assemblies and we've got private assemblies.

Shared assemblies are used by multiple applications.

If I'm deploying a relatively sophisticated application or service on a machine that consists of a lot of different types of services and applications and they all kind of use one of the same dll or assembly, well I don't necessarily want to ship that assembly with every single application and have its users on local copy, because if I have to change, if there is a bug in that common assembly, then I'm going to have to re-deploy to 20 different places on the machine, and so what I will probably do is turn that into a shared assembly.

It's typically stored in what's known as the Global Assembly Cache, and we'll get to that in a little bit, and it uses strong names for identification because shared assemblies that go into the Global Assembly Cache can be used by any app on that machine.

The CLR wants you to place some guarantees by using strong names to make sure that there hasn't been any tampering with that particular assembly.

Private assemblies, on the other hand, they're local to just one application or component typically, and you would deploy it to the same folder or the subfolder where the application resides.

So, for example, if you had a private assembly that your ASP.NET application used, it commonly goes under the bin folder from where your application is deployed.

And private assemblies do not require strong names.

You can have strong names on private assemblies, just not a requirement.


### Global Assembly Cache

Global assembly Cache, so assemblies that you want to share across all applications on a given machine.

They typically end up going into the Global Assembly Cache, and a great example of that are the .NET frameworks.

For example, WPF, WCF, they all end up putting their assemblies into the Global Assembly Cache because they are frameworks that are more than likely going to be utilized by multiple applications.

The Global Assembly Cache is located under the Windows folder \assembly and the assemblies are located by their identity.

So if you have an application that's using a shared assembly that's in the Global Assembly Cache, there needs to be a way of finding out which particular version or which particular instance of that shared assembly that you're wanting to use, and that's done by its identity.

We'll talk a little bit about what identity means.

Assemblies that are located in the Global Assembly Cache do need to have strong names and a digital signature is required.

So the assemblies that go into the Global Assembly Cache, like I mentioned, have an identity, and the identity consists of the following: The assembly name itself, so if my assembly was called myassembly.dll that would be the name of it, the version of it, so major, minor, build, and revision, all four of those pieces, the culture that it was built for, so for example, EN for English, the public key needs to be part of that identity as well, so whatever digital signature that you use to sign that shared assembly with, the public key is part of the assembly's identity, and also we've got processor architecture.

Now, an assembly that is referencing a shared assembly, so if I have an application that uses a WPF assembly, I need to be able to say exactly which WPF assembly it is, and I do that through the identity.

So every single assembly that depends on other shared assemblies, in its manifest will have the entire identity of the shared assemblies trying to reference, and so that's how the CLR knows exactly which one to go and load as part of the assembly's manifest.

Now this can be overridden by policy.

For example, if I've written my application using Visual Studio and C#, I've added references to some shared assembly, say for .NET 2.0, and then I deploy my application, well now the CLR knows exactly which shared assembly to go and find because it's part of my assembly's manifest.

But say for some reason I wanted to, on an already deployed application, say instead of using the one that I referenced when I built this application, I want you to do something else, and that can actually be accomplished without rebuilding, by simple policy, and it's a configuration file that you would place next to your application and tell it to, you know what, any time I'm trying to reference this assembly with this identity, please use this other one instead.


### Demo - Looking at assemblies

Now let's take a look at a demo here on how we can get more information about the assemblies that are loaded into a CLR process.

The application I'm going to run here is the same one we did in the previous demo, 02Simple.

It's pretty straightforward, it's one WriteLine, Welcome to Advanced .NET Debugging.

Let me run this under the debugger and resume execution, app has written out its Welcome to Advanced .NET Debugging output, I'm going to break in, here's the command like we did last time, DumpDomain, and as explained previously you get the listing of all the domains.

Well what we're interested in particular here is this assembly.

The domains will each have one or more assemblies loaded in it.

In this case this assembly is our 02Simple, that's our binary.

And I can take that address and just do a DumpAssembly, and that gives me some information such as what the Parent Domain is, and this really should map back to the default app domain, Domain 1.

We can see that it does that nicely.

It gives it a name of it and then also the modules that it contains, and of course this is the most common single file assembly, so the module is actually inside of the assembly itself.

So that's kind of how you would get more information about assemblies that are loaded.

We can take a look at a slightly more interesting example here, and it's an application called 05OOM.

If I run this application it's going to slowly, slowly, start creeping up in memory.

So let me run this under the debugger.

So my application is running.

We're going to let it run for a bit here and see if we can let it accumulate some memory and figure out what the problem is.

Alright, so that should be enough.

I broke into the debugger, and I'm going to use a command, again, don't worry about memorizing the commands or anything.

We're going to be using these and they're going to be fully explained in subsequent modules, but this particular command at a high level dumps out all the modules that are loaded on a per application domain basis, and if I run this, really what I should expect should only be a few modules because the application is pretty straightforward and trivial.

If we look at the source code for it, it's got one class called Person that's just got some properties that you can set, but it doesn't get any fancier than that.

And we've got our Main function here.

It calls Run.

The only thing that Run does really is sits in a tight loop, creates a new instance of a Person object, and then serializes it to a file.

That's all that this application does.

So what we would expect reasonably is that, well, all this code is in one assembly, and since it's a single file assembly this will all be in one module.

So we know we should see one module in the module list in the debugger.

Now there could be some other modules that are brought in as part of, for example, serialization etc., but we should probably not see more than 10, 12, or 13 modules because it's a pretty small application.

So let me switch back to the actual app in the debugger, and let's issue this command to see the modules that are loaded.

And what we can see here is that there are quite a few.

I just keep scrolling up here.

(scrolling) so a lot of modules are being loaded, and that is actually the reason why this application keeps increasing in memory.

Well if you wanted to get a little bit more information, I'll use DumpDomain because all assemblies and hence all modules are loaded into an application domain, and I can see that there are a lot of assemblies loaded into an application domain.

As a matter of fact, if I just keep scrolling up, I'll scroll up and here is where the output begins.

Domain 1, which is the default application domain, lists out all the assemblies, so this is 05OOm.exe, we expect that, that's our app, System.Xml, so we're referencing XML serialization so that's okay, Configuration.dll, that's a framework dll so that's probably okay, but now, we start seeing some really bizarre assemblies where the name of the module is something bizarre like xkn9wy1m, and if I keep scrolling down that seems to be the pattern here.

We have a lot of these oddly-named assemblies.

This is a very common problem that you'll see in applications.

.NET has the notion of dynamically creating assemblies, so at runtime you could create an assembly and it will just be loaded and treated as a normal assembly by the CLR.

Well in this particular case, if we go back to our code, we're not really loading any assemblies or creating any assemblies, all we're doing is doing XML serialization.

The tricky part here is that your code may not be creating dynamic assemblies, but other parts of code that your dependent on may, and as it turns out the XmlSerializer, for optimization reasons, will create dynamic assemblies under the cover.

It will do that for every single time you do a new instance of the XmlSerializer.

More specifically, the XmlSerializer actually has roughly about seven constructors.

All seven constructors will create a dynamic assembly.

Five or those constructors will cache it so that next time you try to create a new instance of an XmlSerializer class it will use one that's cached if it's available.

Two of them don't cache anything, it will just create it every single time, and it so happens that we are using the one that doesn't cache it.

So it's just going to sit here and create new dynamic instances every single time it goes through this loop, a very, very common problem.

Now the next kind of question that might pop into your head here is well, can I unload a dynamic assembly, or can I unload an assembly period, and the answer to that is, no.

Once an assembly is loaded into an application domain, it will stay there forever, until the application domain is unloaded, at which point all the assemblies in that app domain get unladed as well, but you can't cherry-pick assemblies in an application domain and unload individual ones, and that's the danger behind this particular problem, because eventually your process will run out of memory because of this.

### Assembly Manifest

Now assemblies, besides containing the modules, which of course contains all the code itself, it also contains this thing known as an assembly manifest.

And, really, the assembly manifest resides either in the PE image of the assembly itself or in a separate PE image in case of multi module assemblies, which, again, are not that common.

Now the assembly manifest itself contains a list of all the dependent assemblies.

So if, for example, my application was using XML serialization, which is a feature of the framework, I would reference the XmlSerializer assembly from my assembly, and that reference would be stored in the assembly manifest together with all of the other dependent assemblies.

It will contain the version of the assembly, the public key if it's been signed, and additional resources.

### Demo - Looking at assembly manifests

Let's do a demo of a pretty nifty tool called __ILDASM__, it stands for Intermediate Language Disassembly, which allows you, amongst other things, to look at an assembly's manifest.

Now ILDASM ships as part of the SDK, the.NET SDK, and you can simply run it to UI app, and in here you can go and open up assemblies if you want to take a closer look at it.

I'm going to use 02Simple, which is the very trivial Hello World type of application, and what you'll notice is that it showed you a couple of things in a tree view here.

One is a manifest node, and then it also shows you some other information about the app.

And this is broken down by namespace, so I've got Advanced.NET.Debugging.Chapter2 in that namespace, I've got a class, which is called Simple, and the class itself contains a constructor and the Main method.

So not only does it give you a breakdown of what hierarchically is contained within the assembly, but it seems to also show you the methods that are on it.

As a matter of fact, if I double-click on my Main method, it goes ahead and disassembles the code for me, and this is an example of the Microsoft Intermediate Language Instructions, so very, very handy if you want to go and look at the code in a particular assembly if, for example, you don't have the source code available.

But let's turn our attention to the manifest.

If I open up that node by double-clicking, I'll notice that what I have in here is a bunch of information.

Now the first one is a.assembly extern mscorlib, so this is an indication that it's dependent on the mscorlib assembly.

Furthermore, it's dependent on this specific version with this particular public key token.

If my application was dependent on more than just mscorlib, say for example, XML serialization, that assembly would be listed here as well.

Now our assembly itself, 02Simple, basically says that there are a couple of attributes defined on it.

There is a CompilationRelaxationsAttribute, as well as a RuntimeCompatibilityAttribute.

It has some properties for a hash algorithm and then the version.

I didn't actually explicitly set a version for mine, and so we defaulted to 0:0:0:0.

And then after that there is some other data that you mostly won't have to concern yourself with, it's kind of internal to the CLR and it uses that for its own bookkeeping reasons.

But that's an assembly manifest, a simple one in a nutshell, a list of dependent assemblies followed by information about the actual assembly being looked at.

### Modules

Now let's go from assemblies and what they contain, we already talked about the manifest, and they also contain this notion of modules.

So assemblies are the logical constructs.

They don't really, themselves, contain directly any code or anything like that, rather those are housed in what's known as modules, and they are the "physical" constructs that represents your code.

Modules must be part of an assembly, and if you wanted to build a module and not an assembly, you can use the /target:module switch that's part of the C# compiler, and there's probably the equivalent switches for any other languages that might be running on .NET.

Most commonly, you won't end up doing this because when you build your solution it, behind the covers, kind of builds the module for you and attaches it to the assembly, but if you had the need to do so then you can use that switch.

Once you have one or more separate modules that are outside of an assembly, you can then make them part of an assembly by using the /addmodule switch to the C# compiler.

So, in essence, the C# compiler allows you to build this thing known as a module, but you can't really do anything with it because it has to be part of an assembly and then you can use the addmdule switch to associate the module with one or more assemblies.

### Types Overview

So now we've gone from assemblies being a logical construct to containing one or more modules, which is more of a physical construct because the modules contains your code.

Well in as far as code is concerned, we need to have a discussion around types.

So that is the fundamental unit of programmability.

So, for example, in C# the class construct is a type, so if I write class, my class, and all the properties methods that I have on that class, well that class itself, my class, is considered to be a type.

So you have custom-defined types.

That's the types that you define in your own applications.

You have the built-in types, for example, the.NET framework classes ranging from something as simple as a string class all the way up to something as complicated as a web caching class, for example.

But these are all examples of types, right.

The CLR doesn't care whether or not it's a type coming from the frameworks or if it's a type defined by you, they're all treated the same.

Now there are two primary categories when it comes to types.

There are value types and there are reference types, and we're going to go into a little bit more detail on these because they have been known to create some headaches in code because of the way that the CLR treats them.

### Value Types

So let's start our discussion on types with the concept of a value type.

Value types are stored on a threads stack.

Characteristics of value types, that they're small in size, and this makes perfect sense because in as far as the amount of available stack space you have is very limited so you want to avoid having large objects on a thread stack.

And typically they're the primitive types, such as a bool, an integer, enum, and some more.

They do not incur the same overhead as reference types.

A reference type goes on what's known as the managed heap.

As soon as an object or reference type goes on the managed heap, it will incur some additional overhead, both in as far as the size of the object is concerned, as well as the overhead that's associated with the garbage collector, because anything that goes on the managed heap is managed by the garbage collector, so a lot of overhead there.

Value types do no suffer from that because they're on a thread stack.

There is one caveat(告诫) here, which is known as __boxing and unboxing__.

If you have a value type and you want to pass it to an API that expects a reference type, the CLR does some magic in the background known as boxing where it takes the contents of the value type, instantiates a new instance of the reference type on the managed heap, so now we've got that additional overhead incurred.

It then copies the contents of the value type into the reference type, and that's how we can perform that almost magical transformation from a value type to a reference type, and it does that automatically.

In the same way, if a reference is being returned from a function, say, and it's being assigned to a value type, you incur this additional overhead of copying the contents of the reference type into the member area of the value type, and that's known as unboxing.

This has been known to create serious, serious performance issues in applications where, for example, the application is sitting in a relatively tight loop making a function call, and every single time that function call is made it boxes on the way in and unboxes on the way out and adds a lot of overhead, so that's something to be aware of.

### Reference Types

Now let's talk about reference types, which are different from value types.

Remember, value types are always stored on a thread stack.

Reference types, on the other hand, are stored on the managed heap, and as a result of that they are managed by the garbage collector.

So this is the entity, again, we have an entire module on that coming up later, however, the garbage collector is responsible for looking at every single object on the managed heap, and there could be quite a few of them, and ensuring that objects who are not alive, considered garbage, get collected automatically.

And because of that additional overhead, objects that go on the managed heap will have to play nicely with the garbage collector.

Here is an illustration of value types and reference types.

If I have a local variable that points to something, and that something happens to be an address that resides on a thread stack, well then you know that the type that is being pointed to is a value type.

Reference types, on the other hand, you'll have a local variable that points to something, and this pointer happens to be pointing into an area of the managed heap, and therefore that must be a reference type.

Now it could be masquerading as a value type, if you will, if it's been boxed, but this masquerading is not something that is treated like anything special, it is really just still a reference type on the managed heap.


### Demo - Looking at types

Let's take a look at a demo on how we can view the values of a value type in the debugger.

We've got an application called TypeSample.

exe, and if I run that, it shows me some coordinates, X, Y, Z, right, pretty straightforward.

I'm going to run the application under the debugger, let it resume execution until it prints out these coordinates.

Then I'll break in and I'm going to switch over to thread 0 because that was a simple single-threaded application.

I'm going to look at what the CallStack looks like.

We've got our Main method calling AddCoordinates, and let me use the -a to get arguments, local parameters for each of those frames.

Here is our AddCoordinates function.

It's got a parameter that's passed into it and it's got some local variables, and what I'm interested in is the last one here.

That's kind of the address of that local variable.

If I wanted to see the contents, I can dump the contents out, and what I'll notice is the same values, oh this is x, that we saw in the output up here, so 6e 110, 37, 55, and then 110 again, which is the 6e.

So value types are actually pretty straightforward to view in the debugger because you can just kind of dump them out using the raw memory dump commands.

Reference types, on the other hand, is a little different and you've got to use a special command to do that, and we'll show examples of that later on.







