# Getting Started with Dependency Injection in .NET

## Author

### Jeremy Clark

Jeremy Clark makes developers better.


By drawing on over 15 years of experience in application development, he helps developers take a step up in their skill set with a focus on making complex...


## Description

Tight coupling makes our code hard to change and test.


In this course, "Getting Started with Dependency Injection in .NET", you will learn the foundational knowledge to break tight coupling with Dependency Injection.


First, you will learn how to use constructor injection to create loosely-coupled code.


Next, you will see how to snap those loosely-coupled pieces together in different ways to easily change functionality.


Then, you will discover how easy it is to unit test code that uses dependency injection.


Finally, you will explore some of the magic of dependency injection containers.


When you are finished with this course, you will have the skills and knowledge of dependency injection needed to break tight coupling and write more maintainable code.

### Content

* Course Overview
  * Course Overview
* What Is Tight Coupling and How Does It Impact Your Applications?
  * Course Overview
  * What is Dependency Injection?
  * Application Overview
  * Demo: Application Projects
  * Demo: The Data Store and Data Access Layers
  * Demo: The Presentation Layer
  * Demo: The View Layer
  * The Problem of Tight Coupling
  * Difficult Updates
  * Summary
* Using Dependency Injection to Build Loosely-coupled Applications
  * Overview
  * The Repository Interface
  * Demo: Loosening Coupling with an Interface
  * Demo: Breaking Coupling with Constructor Injection
  * What is a Bootstrapper?
  * Demo: Adding a Bootstrapper
  * Summary
* Taking Advantage of Loose Coupling
  * Overview
  * Different Data Sources
  * Demo: Adding a Text File Data Reader
  * Demo: Adding a SQL Database Data Reader
  * The Decorator Pattern and Client-side Caching
  * Demo: Adding a Client-side Cache
  * Summary
* How Dependency Injection Makes Unit Testing Easier
  * Overview
  * What We Want to Unit Test
  * Demo: Adding a Fake Dependency for Testing
  * Demo: Unit Testing with Constructor Injection
  * Property Injection
  * Demo: Unit Testing with Property Injection
  * Summary
* Dependency Injection Containers
  * Overview
  * Dependency Injection Container Features
  * Demo: Using Ninject
  * Demo: Using a Decorator with Ninject
  * Demo: Using Autofac
  * Demo: Manual Registration with Autofac
  * Demo: Using a Decorator with Autofac
  * Demo: Late Binding with Autofac
  * Demo: ASP.NET Core MVC Dependency Injection
  * Dependency Injection Container Summary
* Course Summary

## Transcript

### Course Overview

#### Course Overview

Hi everyone.


My name is Jeremy Clark.


Welcome to my course, Getting Started with Dependency Injection in .NET.
欢迎参加本课程——基于.NET的依赖注入入门。

I am an international speaker and consultant who makes developers better.

Like most developers, I was introduced to dependency injection completely backward.
和很多开发者一样，我了解依赖注入的过程完全是倒着的。

I was given an application that already had a dependency injection container and told, good luck.
我拿到了一个应用，包含了依赖注入的容器，然后被告知自求多福吧。

After I took a step back and understood the concepts, I found that dependency injection can make my code easier to maintain, extend, and test.
在我掌握了依赖注入的概念后，我发现依赖注入可以是我的代码维护，扩展，测试，变得更加简单。

This course is a practical introduction to the concepts and patterns of dependency injection.
本课程是对依赖注入的概念和模式的实例教程。

Some of the major topics that we will cover include understanding the problem of tight coupling, using constructor injection to break that coupling, quickly updating code by changing data sources and adding caching features, and easily unit testing code.
课程将涉及几个话题，包括理解紧耦合问题，使用构造函数注入来解耦合，快速更新代码以改变数据源，增加缓存特性，以及简单地单元测试。

By the end of this course, you'll be comfortable with the concepts and patterns of dependency injection, and you'll be ready to explore further with dependency injection containers.



Before beginning this course, you should be familiar with the basic features and syntax of the C# language including C# interfaces.
课程开始前，你需要熟悉C#语言的基本特性和语法，包括C#接口。

And after completing this course, you should feel more comfortable diving into courses on dependency injection containers, advanced dependency injection concepts, and SOLID principles.
课程结束后，你将掌握依赖注入的概念和模式，以及能够进一步探索依赖注入容器，更高级的依赖注入概念，以及SOLID原则。

I hope you'll join me on this journey to maintainable code with the Getting Started with Dependency Injection in .NET course, at Pluralsight.


### What Is Tight Coupling and How Does It Impact Your Applications?

#### Course Overview

More and more of our frameworks include dependency injection containers built right in, and it is hard to turn around without hearing someone talking about dependency injection.


But what is dependency injection, and why would we want to use it? A big problem is how we are typically introduced to dependency injection.


Quite often, we are given an application that already has a dependency injection container in it, and we're told, good luck.


Looking at the existing code does not make things more clear.


That is because much of the functionality is hidden inside the dependency injection container.


This is good when we understand dependency injection and how it works.


It is not so good when we're new to the concepts.


So what happens when we need to add some code, maybe a new module or some additional functionality? Well, we just take our best guess at it.


This means that we copy and paste some of the dependency injection code, make a few changes, and then we hope that it works.


This is not a good way to write code, so we will take a bit of a different approach.


The first thing we will do is stop and take a step back away from dependency injection containers.


Then we will look at some of the key concepts of dependency injection such as loose coupling, object composition, and various patterns.


This will help us understand why we may want to use dependency injection and how to use those concepts.


And along the way, we will look at lots of code.


I tend to learn best with code and seeing the concepts in action, so that is what we will do here.


To follow along with the code, you should have a good understanding of the basics of the C# language.


This includes things like classes, interfaces, constructors, and properties.


The samples include specific technologies, like WPF, Entity Framework, and web API, but you do not need to have experience with these technologies in order to follow along.


We will use the same project throughout the course.


To build the sample, I used Visual Studio 2017 with 2 workloads installed, .NET desktop development, which includes the WPF parts, and ASP.NET and web development, which includes the web API and .NET Core bits.


The solutions use a variety of projects including .NET Framework 4.7 .2 for the desktop application, .NET Standard 2.0 for all of the libraries, and .NET Core 2.2 for the web API project, as well as the unit testing projects.

越来越多的框架植入了依赖注入容器，想要正确使用依赖注入容器，首先需要了解依赖注入。

那么什么是依赖注入，为什么我们想要使用它，一个主要问题是我们通常是如何介绍依赖注入的。

通常，我们拿到一个包含了依赖注入容器的应用，然后被告知自求多福吧。

光看手头的代码很难把问题解释清楚。

因为许多功能都隐藏在依赖注入容器背后。

所以如果我们理解依赖注入以及他是怎么工作，那就很好。

但如果我们刚开始接触这个概念，那就不那么好了。

因此，当我们想增加一些代码，比如一个新的模块，或者一些额外的功能，会发生什么？

我们拷贝粘贴一些依赖注入的代码，稍作改动，我们期望他能够运行。

这不是一个好的写代码的方式，因此我们使用一些不同的办法。

我们要做的第一件事是暂时不用依赖注入容器。

然后我们将看一下依赖注入的关键概念，比如松耦合，对象组合，以及各种模式。

这将帮助我们理解为什么我们要使用依赖注入，以及我们如何使用它，期间，我们将看不少代码。

我倾向于在编码中学习，这需要你们有C#语言的良好基础，包括类，接口，构造函数，属性。

样例包含了WPF，Entity Framework，web API等技术，但是你不必掌握这些技术来理解课程内容。

整个课程我们将使用同一个工程。

为了编译样例，我使用了VS 2017，.NET 桌面开发，包含了WPF，ASP.NET 和 web开发，包含了 web API和一些.NET Core。

#### What is Dependency Injection?

To start out, we will look at what dependency injection is and why we want to use it.


This includes the benefits that we get from loose coupling, some of the patterns that we can use to get these benefits, and a list of some of the more popular dependency injection containers in the .NET world.


We will not spend very much time on these things here.


We just want to get some of the terminology so that we know what to look for when we dive into the problem.


As mentioned, we will spend most of the time looking at code.


So we'll take a quick look at the sample project and some of the problems we come across when we are not using dependency injection.


It can be hard to nail down a good definition of dependency injection.


This is 1 of those things where if you asked 10 developers about dependency injection, you will get 12 different answers.


As an example, I have been teaching developers about dependency injection since 2012, and I have kept an eye on the Wikipedia description.


It has changed many times over the years, so much so that I stopped looking.


But it does point to the problem.


Fortunately, there is a good description that we can use.


Dependency injection, or DI, is a set of software design principles and patterns that enable us to develop loosely-coupled code.


The thing I like most about this definition is that it tells us what the goal is, loosely-coupled code.


So why do we care about loose coupling? First, code that is loosely coupled is easier to extend.


We can add functionality without making changes to all of our objects.


Loosely-coupled code is easier to test.


We can isolate pieces of functionality so that we can write short, easy-to-read unit tests.


We also get code that is easier to maintain.


When something goes wrong, we can more easily find the piece of our code that needs to be updated.


And if you've worked on a team of developers, you have probably experienced every developer's least favorite message.


When you go to check in your code to source control and you get the question, how would you like to merge these files? The answer is, I do not want to merge these files, just accept my changes.


If we have loosely-coupled code, then the developers working on the business logic are changing their files, and the developers working on the data access are changing their files.


Merge conflicts in that environment become quite rare.


Finally, loose coupling makes late binding much easier.


Late binding, or runtime binding, is when we make decisions at runtime rather than compile time, and this can be very useful for certain scenarios.


In this course, we will look at extending and testing our code.


And later on, we will see how late binding becomes very easy particularly if we use a dependency injection container.


In addition, as we go through the code, we will see how we can follow the SOLID principles.


The SOLID principles are a set of five programming design principles that help guide us towards better code.


I will just be mentioning the SOLID principles as we go.


Pluralsight offers a course on SOLID if you would like to learn about the principles in detail.


There are a number of patterns that we can use to implement dependency injection.


This gives us options depending on what our needs are.


The patterns include constructor injection, property injection, method injection, ambient context, and the service locator.


In this course, we will concentrate on constructor injection and property injection, the two patterns that I have found most useful.


But it's good to understand that there are other options available if your needs are a bit different.


We cannot talk about dependency injection without mentioning dependency injection containers.


There are a large number of containers available in the .NET world.


These are a few of the most popular, full-featured containers.


The good news is most of them have similar functionality.


I have used Unity and Ninject in production environments with good success.


We will spend most of our time not using a dependency injection container.


This is so that we can get a firm grasp about the dependency injection concepts.


This will remove the magic and make it much easier to use the containers.


In the last module, we will look at using Autofac and Ninject in code.


In addition, we will see the built-in container that is provided with ASP.NET Core MVC.


This is not a full-featured container, but it works very well for the most common scenarios.

首先，我们来看下什么是依赖注入，以及为什么我们要使用它。

这当中包括了我们能从松耦合获得的益处，我们能获得这些益处的一些模式，以及一些在 .NET 世界中流行的依赖注入容器。

这里我们不花太多时间在这些事情。

我们只是想了解一些概念，以便我们知道当我们向内探索的时候我们想要了解什么。

正如我提到的，我们将花费大部分时间在代码上。

因此我们将快速的看下当我们不使用依赖注入的时候我们会遇到的问题。

想要给出依赖注入的良好定义是困难的。

当你问10个开发人员关于依赖注入的问题，你将获得12个答案。

比如，我从2012年开始教开发人员关于依赖注入的知识，我一直关注着维基百科的描述。

在这些年里，维基百科的描述变了太多次，所以我都不愿意再去看了。

但他确实反映除了问题。

幸运的是，还是有好的定义我们可以用。

依赖注入，或者 DI，是一系列软件设计原则和模式用于开发解耦合的代码。

这个定义我最喜欢的一点就是它告诉了我们目标是什么，解耦合的代码。

那么为什么我们关心解耦合？

首先解耦合的代码更加易于扩展。

我们能够在不改变大量对象的情况加增加功能。

我们能够将功能独立开来，以便编写简短的，易于阅读的单元测试。

我们也获得了易于维护的代码。

当什么出错的时候，我们能够更加容易发现我们需要修改那部分内容。

当你在一个开发团队中工作时，你可能经历了每个开发人员最不喜欢的消息。

当你打算 check in 代码的时候，有人会问你，你希望怎么合并这些代码？答案是，我不想合并代码，接受我的更改就是了。

如果我们有解耦合的代码，那么处理业务逻辑的开发者只修改他自己的代码，处理数据读取的开发者也只修改他自己的代码。

在这种环境下合并冲突就很少会发生。

最后，解耦合可以使延迟绑定变得更加容易。

延迟绑定，或者运行时绑定，是我们在运行时做决定而不是编译时，这在特定场合下很有用。

在本课程中，我们将看下扩展和测试我们的代码。

之后，我们将看到使用依赖注入容器时实现延迟绑定将变得多容易。

另外，当我们讲解代码时，我们将了解如何参照SOLID原则。

SOLID原则包括了个五个编码设计原则，能够帮助我们写出更好的代码。

我们只是简要带过SOLID原则的部分内容。

Pluralsight提供了SOLID课程，如果你想更具体地学习。

有许多模式可以供我们来实现依赖注入。

这给了我们选择， 取决于我们需要什么。

这些模式包括了构造函数注入，属性注入，方法注入，ambient context 以及服务定位器。

本课程中，我们将聚焦于构造函数注入和属性注入，两个我们最常用的模式。

但我们要知道还有其他的选择，如果你的需求不太一样的话。

要讲依赖注入就不得不讲依赖注入容器。

在 .NET世界中有很多容器可以用。

其中有一些最流行，功能最全的容器。

好消息是大部分拥有类似的功能。

我在实际生产环境中使用过Unity和Ninject并取得了不错的效果。

我们大部分时间将不使用依赖注入容器。

这样我们就能更好的理解依赖注入的概念。

这有利于能容易的使用容器。在最后我们将会看下如何在代码中使用Autofac和Ninject容器。

另外，我们将看下ASP.NET Core MVC内置的容器。

这不是功能齐全的容器，但是对大多数应用场景来说已经够了。

#### Application Overview

We will build on the same sample application throughout this course.


This application is both simpler than it needs to be and more complex than it needs to be.


The application is simpler than it needs to be because it is a one-screen application.


The application gets data from a web service and displays it in a list box.


Normally, I would not use dependency injection on a small application like this.


The added complexity is often not worth it.


But if I were to show you a real application where I have used dependency injection, it would be really easy to get lost in the application architecture, communication between modules, business processes, and many other things.


So we will use a one-screen application so that we can stay focused on the dependency injection concepts.


The application is also more complex than it needs to be because the one-screen application is split up into multiple layers.


Normally, I would not layer a one-screen application like this.


But again, this will let us focus on the dependency injection concepts, and we will see how dependency injection can help us solve issues that we have in larger applications.


The application consists of four layers.


The view is the UI of the application.


It consists of the user interface, UI, elements such as the buttons and the list box.


The presentation layer is the logic for the UI.


This has functions that the buttons call and also a property that is data bound to the list box in the UI.


The data access layer is the code that knows how to interact with the data store.


For the initial example, we get data from a web service.


The data access layer knows how to make a web service call, and then translate the results into objects that the rest of the application can easily use.


The data store is where we get our actual data.


In this case, a web service provides the data.


So let's go to the code and look at this application.

本课程中我们将在同一个示例程序中编码演示。

这个应用既简单又复杂。

简单是因为它只有一个应用窗口。

这个应用从网络服务读取数据，然后显示在列表中。

通常我们不会再这么小的应用中使用依赖注入。

增加的复杂性并不值得。

但是如果我给你们展示一个真实的应用，又容易迷失在应用程序架构，模块交互，业务处理，以及其他去多方面的事情。

因此，我们将使用一个单窗体的应用以便于我们能够将注意力放在依赖注入的概念上。

说它复杂是因为这个单窗体的应用被分割成了多个层级。

通常，我们不会对一个单窗体应用这样分层。

但是，这同样有助于我们关注依赖注入本身，以及我们将看到依赖注入是如何帮助我们在大型应用中解决问题的。

这个应用分为四层。

视图层是应用的界面。

它由用户界面，控件比如按钮，列表等组成。

表现层处理UI的逻辑部分。

包含了按钮事件调用的函数，UI界面列表绑定的数据对应的属性。

数据访问层负责与数据仓库的交互代码。

示例的开始，我们从网络服务获取数据。

数据访问层知道如何发起一个网络服务调用，然后将数据存储到对象中，以便应用的其他模块可以方便的使用。

数据仓库是我们获取实际数据的地方。

这个例子中，一个网络服务提供这些数据。

那么让我们一起来看下代码和这个示例程序。

#### Demo: Application Projects

We will start by getting an overview of the application.
首先我们来看下这个应用程序的大概。

This is important since we will use the same code for the entire course.
这是很重要的因为我们将在整个课程中使用同一份代码。

So, let's head over to Visual Studio.
因此，我们切换到Visual Studio。

Here's the sample application.
这就是示例应用。

Before we run the application, we need to start the web service.
在我们运行应用程序之前，我们需要启动网络服务。

This is the People.Service project.
这是People.Service工程

It's an ASP.NET Core project, so we will start it from the command line.
这是ASP.NET Core工程，我们将从命令行启动。

I have the Visual Studio Productivity Power Tools installed, and this is available free from the Visual Studio Marketplace.
我安装了isual Studio Productivity Power工具，在Visual Studio应用市场免费使用。

So if I right-click on the project, go to Power Commands, and then Open Command Prompt, this will put us in the project folder for the web service.
因此如果我在项目上右键，打开 Commands Prompt，直接就会进入网络服务的工程目录。

To start the service, type dotnet run.
要开始服务，输入dotnet run。

And now we can see the service is listening at this address, http://localhost port 9874.
现在你能看到服务正在侦听 http://localhost，端口9874。

So let's copy this address into the browser to see what we have.
因此我们拷贝这个地址到浏览器看看会得到什么。

Now in addition to the location, we're also going to add /api/people because that's the endpoint where the service is listening.
现在在这个地址后面，我们加上 /api/people，因为那是服务侦听的终端。

And when we do that, we see we get the data from the web service.
当我们这么做的时候，我们看到了来自网络服务的数据。

So this shows us that the service is running.
因此这代表着服务正在运行。

Let's flip back to Visual Studio and run the application.
让我们回到Visual Studio 然后运行这个程序。

I'll just press F5 to run, and when we click the Fetch People button, we see the data comes back in a friendly format.
我按F5运行，当我们点击Fetch People 按钮，我们能够看到数据以友好的格式返回了。

Also, down at the bottom, we see the data reader that is used, PersonDataReader.Service.ServiceReader.
同时，在底部，我们看到数据读取模块使用了PersonDataReader.Service.ServiceReader。

So let's close the application and look at the projects.
因此让我们关闭应用并看下这些工程。

The pattern that we're using here is known as MVVM, which stands for model-view-viewmodel.
我们这里使用的模式叫做 MVVM， 就是 model-view-viewmodel。

Don't worry if you have not used the MVVM pattern before.
如果你没用过MVVM模式也有没关系。

You'll be able to follow along with the code just fine.

In MVVM, the view is the UI of the application, the view model is the presentation logic, and the model is everything else.
在 MVVM 中，view是应用的UI，view model是表现逻辑层，model 是其他部分。

Let's walk through the projects to see the various layers.
让我们通过这些工程来看下各个层级。

First, we have the view layer.
首先，我们有视图层。

This is the UI of the application.
这时应用的UI。

The PeopleViewer project is a WPF project using .NET Framework 4.7 .2.
PeopleViewer工程是WPF工程使用.NET 4.7.2

This contains the UI elements such as the window, the buttons, and the list box.
包含了UI控件，比如窗体，按钮，列表。

The next layer is the presentation layer.
下一层是表现层。

This contains the presentation logic that drives the UI, and this is where the view model lives in the MVVM pattern.
包含了驱动UI的表现逻辑，这也是MVVM中的视图模型层。

The project, PeopleViewer.Presentation, is a .NET Standard class library that has this presentation logic.
工程PeopleViewer.Presentation，是包含了表现逻辑的.NET标准类库。

The next layer is the data access layer.
下一层是数据获取层。

The project here, PersonDataReader.Service, is a .NET Standard class library, and this knows how to get data from a web service, and then provide the C# objects that the presentation layer can use.
PersonDataReader.Service 是.NET标准类库，知道如何从网络服务获取数据，然后提供能够被其他表现逻辑层使用的C#对象。

The last layer is the data storage layer, and this is where our data resides.
最后一层是数据仓库层，也就是数据存储的地方。，

The People.Service project is an ASP.NET Core Web API project.
People.Service 是 ASP.NET Core Web API 工程。

As we've seen, this is a web service that provides the raw data that the data access layer uses.
正如我们看到的，这是提供原始数据的网络服务。

Finally, we have the PeopleViewer.Common project.
最后，我们有 PeopleViewer.Common 工程。

This is a .NET Standard class library that has objects shared across all of the layers.
这是一个.NET 标准类库为其他层级提供公共对象。

Right now, it has the Person class.
现在，还有一个类 Person。

When we look inside this class, we see that it consists of six properties and an override of the ToString method.
当我们看过这个类之后，它包含了六个属性，一个重写的 ToString 方法。

These are the properties that are shown in the UI.
这些是显示在UI上的属性。

Now that we've seen the overall application, let's walk through the layers to see how they work.
现在我们浏览了整个应用，让我们看下各个层级是怎么工作的。


#### Demo: The Data Store and Data Access Layers

In this demo, we will take a look at the data storage layer that supplies the data and the data access layer that fetches the data and puts it into a useable format.


We're going to start with the bottom layer, the data storage layer, and work our way up to the top layer, the view layer.


The People.Service project has the web service, and the endpoint is in the PeopleController.


The Get method of the controller returns an IEnumerable of Person objects.


These come from a provider, and this case, a StaticPeopleProvider in the Models folder.


The StaticPeopleProvider has a GetPeople method that returns a hardcoded list of Person objects.


Our service is still running from the previous example, so we can go back to the browser and see our data displayed.


So this is the data storage layer for the application.


The next layer is the data access layer.


Let's go ahead and close all of our files and take a look at that.


Inside the DataAccess folder is the PersonDataReader.Service project that has a ServiceReader class.


This is the class that gets data from the web service that we just saw.


The service reader has a WebClient field that gets newed up when the class is instantiated.


The GetPeople method uses the web client to get data from the service.


This comes back as a JSON string.


So, we use Newtonsoft.Json to deserialize the string into an IEnumerable of Person objects.


The GetPerson method is similar, but it asks the web service for an individual record.


One thing to note here is that I'm using a web client rather than an HTTP client.


I did this for simplicity.


The current practice is to use an HTTP client with asynchronous methods; however, I wanted to keep the API a bit simpler so that you do not need to have a good understanding of task or async programming in order to follow along.


So we have seen the data storage layer that provides us with the data, and we've seen the data access layer that knows how to interact with the data store.


The next layer up is the presentation layer, and that's what we'll look at next.



#### Demo: The Presentation Layer

The next layer in the application is the presentation layer.


This layer has the presentation logic for the application.


It is responsible for having methods that can be called from the UI and providing properties that can be data bound to the UI.


The PeopleViewer.Presentation project has a PeopleViewModel class that does exactly that.


In this class, we have methods that we can hook up to buttons, RefreshPeople and ClearPeople, and we also have a People property.


This is data bound to the list box that we have in our UI, and we'll see that data binding in the next demo.


We have one more property, which is the DataReaderType.


This gets the actual type of the data reader so that we can display it in the UI.


This is the text that appears at the bottom of the list box.


So let's take a closer look at how this code works.


We have a protected ServiceReader field to hold the service reader that we saw in the data access layer.


In the constructor of the view model, we new up an instance of the ServiceReader and assign it to that protected field.


Then, in the RefreshPeople method, we call the GetPeople method on the DataReader and put the result into the People property.


Since the People property is data bound to the list box, that's how the UI gets populated.


The ClearPeople method assigns a new empty list to the People property.


This has the effect of clearing out the property, and through data binding, it will clear out the list box as well.


Finally, we have the DataReaderType property.


This is a calculated property that gets us the fully qualified name of the data reader.


This is the PersonDataReader.Service .ServiceReader string that we saw in the UI earlier.


We have seen three layers so far, the data storage layer that provides the data, the data access layer that interacts with the data store, and the presentation layer with the view model that provides the UI logic.


The last layer is the view, the UI of the application.



#### Demo: The View Layer

The last layer of the application is the view, the user interface of the application.


This is in the PeopleViewer project.


This is a WPF project that contains the UI elements including the buttons and the list box.


If we look inside the project at the PeopleViewerWindow.xaml file, we see the layout of the form.


Now we won't look at the details of the markup.


I just want to click on the list box and look at one property that we have.


If we look at the list box, we see that it has a property called ItemsSource, and this has a binding to people.


This is what sets up the data binding of the list box to the People property.


The next question is how does the list box know which object to find this People property on? That is set up in the code-behind of the form.


So we'll just right-click and say View Code, and this takes us to the PeopleViewWindow.xaml .cs file.


The first thing to notice is that we have a PeopleViewModel field.


This holds the view model from the presentation layer that we looked at earlier.


In the constructor, we new up an instance of the PeopleViewModel and assign it to this field.


The last step of the constructor is to set the DataContext of the window to the viewModel.


The data context is there for data binding.


So when our list box is data bound to the People property, it checks the data context to see what object has that property.


It is a little more complex than this because WPF data binding is very powerful.


But since the DataContext is set to the viewModel, the data binding mechanism looks for the People property on the view model.


The Button_Click event handlers pass calls through to the view model.


So FetchButton_Click calls the viewModel.RefreshPeople method, and ClearButton_Click calls the viewModel.ClearPeople method.


In addition, these buttons have code to show or clear the repository type that appears at the bottom of the screen.


As a side note, this is just one implementation of the MVVM design pattern.


I've seen about a half dozen different ways of implementing the pattern that work well.


Developers who use WPF regularly use something known as commanding, which allows us to data bind to methods.


I opted to use the pass-through methods on the event handlers so that we don't have to understand the details of commanding.


So let's run the application and think about what happens.


At this point, our web service is still running, so I don't need to restart it in this case.


So, when we click on the button in the view, it calls the RefreshPeople method on the view model.


The view model calls the GetPeople method on the data reader.


The data reader calls the GetPeople method on the service.


Then the service returns a collection of Person objects to the data reader.


The data reader returns a collection of Person objects to the view model.


The view model puts those objects into the People property, and through data binding, it updates the list box on the view.


And all of this happens when we click this button.


Like I said, this application is more complicated than it really needs to be.


Now that we have a baseline for the application, let's take a closer look at what is happening.



#### The Problem of Tight Coupling

At first glance, our application looks pretty good.
粗略一看，我们的应用似乎挺好的。

We have good separation of concerns meaning that each layer has a distinct responsibility.
我们有合理地分层，每个层级负责特定的任务。

Things that have to do with the UI are in the view layer.
UI相关的任务都在视图层。

Things having to do with getting data are in the data access layer.
获取数据相关的任务都是数据获取层。

But our application holds a secret.
但是我们的应用隐藏了一个秘密。

And that secret is tightly-coupled code.
这个秘密就是紧耦合。

Even though our layers have different responsibilities, each layer also does a few things outside of those responsibilities, and that leads to tight coupling in our case.
尽管我们层级负责不同的任务，每个层级还是干了一些不属于它职责范围的操作，这导致了紧耦合。

Let's walk through the application to see this.
让我们回到这个应用在看一下。

Here is the constructor for the PeopleViewerWindow.
这是PeopleViewerWindow的构造函数

This is the view layer of our application and contains the UI elements including the buttons and the list 
box.
这是视图层，包含了UI控件。

But if we look in the constructor, we also see that the view is newing up a PeopleViewModel.
但是我们看下构造函数会发现视图正在new一个PeopleViewModel对象。

Whenever we use new in our code, a couple of things happen.
当我们在代码中new一个对象，耦合就产生。

First, we need a compile-time reference to that object.
首先，我们需要在编译时引用那个对象。

If we do not have the compile-time reference, then our code will not build.
如果我们不在编译时引用，那么我们的代码将不会构建。

In addition, whenever we new up an object, we become responsible for the lifetime of that object.
另外，无论何时我们new一个对象，我们就得负责这个对象的生命周期。

The result of this is that the view is tightly coupled to the view model in the presentation layer.
结果就是视图和视图模型、在表现层紧紧地耦合在了一起。

But if we continue, we see that things get worse.
如果我们继续看，会发现事情还要糟糕。

Here is the constructor for the view model, the presentation logic.
这里是视图模型的构造函数，表现层的逻辑。

In the constructor, we new up an instance of the ServiceReader, a data access object.
在构造函数中，我们实例化了一个ServiceReader的对象，一个数据获取对象。

As we just saw, this means that we must have a compile-time reference to the ServiceReader assembly, and we also take responsibility for the lifetime of that object.
正如我们刚提到的，我们对ServiceReader程序集产生了编译时的引用，我们得负责这个对象的生命周期。

And even more of a concern, the view model is selecting which data access technology to use.
更令人担忧的是，视图模型在选择用什么技术来获取数据。

By newing up a ServiceReader, the view model decides that the data will come from a web service.
通过new出ServiceReader，视图模型决定了数据来自网络服务。

The result is that the view model in the presentation layer is tightly coupled to the service reader in the data access layer.
结果就是表现层的视图模型和数据获取层的服务读取器紧紧地耦合了。

But things still get worse.
事情还更糟。

When our ServiceReader is instantiated, it news up an instance of a WebClient to access a production web service.
当我们的ServiceReader初始化时，它实例化了一个WebClient的对象，来获取生产网络服务。

This means that we have a compile-time reference to the web client, and we are also responsible for the lifetime of that object.
意味着我们在编译时引用了web client，我们得负责这个对象的生命周期。

This could be a problem particularly if we want to share a single web client across multiple requests in the application.
这尤其会成为一个问题，当我们想要在应用中多个地方共享同一个web client。

The result is the data access layer is tightly coupled to the data store.
结果就是数据访问层紧紧地耦合了数据源。

The data access layer generally needs to know quite a bit about the data store, so tight coupling here does not bother me that much.
数据获取层通常需要知道数据源相关的一些信息，这里的紧耦合不是那么糟糕。

However, this affects the overall coupling of the application.
然而，这影响了应用程序整体的耦合。

Since the view is tightly coupled to the presentation and the presentation is tightly coupled to the data access and the data access is tightly coupled to the data store, that means that the view is tightly coupled to the data store.
因为视图层耦合着表现层，表现层耦合着数据获取层，数据获取层耦合着数据源，这意味着视图层耦合着数据源。

And that makes me really nervous.
这令我很担忧。

But does it really matter? This is a pretty simple application.
但这要紧吗？这是一个很简单的应用。

Do we need to worry about things like tight coupling? And the answer is yes.
我们应该担忧紧耦合问题吗？答案是YES。

Why? Because I have a boss.
为什么？因为我们有产品经理呀。

#### Difficult Updates

When I show this application to my boss, my boss says, hey Jeremy, this is a great application.
当我把这个应用显示给产品经理，他说，这是个不错的应用。

It gets the data and displays it just like our clients need.
它读取数据并且按照我们的需求显示出来。

But, we need a few more things.
但是，我们需要更多。

The first thing that my boss wants is to connect the different data sources.
首先产品经理希望连接不同的数据源。

It's really great that the application gets data from a web service, but not all of our clients use web services.
应用从网络服务获取数据挺好的，但是并不是所有的客户端都使用网络服务。

Some of our clients use a simple text file with comma-separated values, or CSV, some of them use a SQL database, some of them use a document database, and we want to be able to support clients that use cloud services or even Azure functions.
部分客户端使用逗号分隔的文本文件，或者CSV，部分使用SQL数据库，部分使用文件数据库，我们还希望客户端能够支持云服务甚至Azure功能。

Okay, I think to myself, I'm pretty sure I can do that.
好的，我想我能够干这些。

It just means that I need to change the spot where I new up the ServiceReader.
这表示我们需要在实例化ServiceReader的地方做一些修改。

I can add a switch statement and then based on a parameter, the view model could new up a service data reader, a CSV text file data reader, or a SQL database data reader.
我可以增加switch声明，视图模型可以实例化服务器数据读取器，CSV文本文件读取器，SQL数据库读取器。

This code does not feel very good, but I can make it work.
代码看起来不怎么好，但是他能工作。

But my boss has more requests.
但是产品经理又有更多需求。

The next request that my boss has is for a client-side cache.
下面一个需求是在客户端要支持缓存。

When we talk about our applications, the communication between the data access layer and the data store layer is often the most expensive from a time standpoint.
在我们的应用中，数据访问层和数据源之间的通信通常花费了大部分的时间。

This is because we're generally sending messages across a wire and waiting for a response, and this is affected by network latency and overall bandwidth.
因为我们通常通过网络发送信息，这收到网络延迟和贷款的限制。

Since this is so time consuming, it would be good for us to create a client-side cache.
因为这个过程很耗时，所以支持客户端的缓存是很有必要的。

Then we'd have a local copy of the data that we can reuse instead of always making a network call.
所以我们需要一份数据的本地备份，从而不需要总是通过网络请求就可以重用数据。

One more thing, my boss adds.
此外，产品经理说。

The cache should be optional.
缓存应当是可选的。

Okay.
好的。

So now I think about how I can put this into the application.
因此我开始死开如果把这部分放进应用程序。

I guess I could expand the switch statement so that we can create a service reader or a caching service reader, or we could create a CSV reader or a caching CSV reader, or we could create a SQL reader or a caching SQL reader.
我设想我们可以扩展switch声明来支持带缓存或者不带缓存的各种读取器。

Now this code really does not seem right.
现在这样的代码并不正确。

This looks like something that would be very hard to support, and there is a reason for that.
看起来很难支持，有一个原因。

This code is violating the single responsibility principle, one of the SOLID principles.
这部分代码违反了单一职责原则，SOLID原则的一项。

The single responsible principle says that our object should have one reason to change.
单一职责原则告诉我们我们的对象应当只有一个原因去改变。

But our view model has multiple responsibilities.
但是偶们的视图模型有多个职责。

The primary responsibility is the presentation logic, but it is also picking the data source for the application, and it's managing the lifetime of that data access object.
主要的职责是变现场逻辑，但是它还负责为应用选择数据源，以及负责这些数据源的生命周期。

And in this proposal, it even decides whether we should use a cache.
当前，它还要决定我们是否使用缓存。

We definitely have too many responsibilities, and that is why the code is getting more difficult to manage.
这肯定包含了太多职责，这就是为什么代码变得很难维护。

But my boss isn't done quite yet.
但是产品经理还没有结束。

My boss also wants unit tests on the code, and I agree with this.
他还想要单元测试，我同意。

I am a huge proponent of unit testing.
我是单元测试坚定的支持者。

It has saved me many hours and made coding a lot faster.
他帮助我们节约了很多时间。

But we have a problem if we try to write a unit test for our view model in the presentation layer.
但是我们有一个问题，如果我们尝试为表现层的视图模型写单元测试。

In the unit test, we need to create an instance of the view model.
在单元测试中，我们需要实例化视图模型对象。

But in the constructor of the view model, we new up an instance of the ServiceReader, and the ServiceReader news up a WebClient that connects to the production web service.
但是在视图模型的构造函数中，我们实例化了ServiceReader，ServiceReader实例化了连接网络服务的WebClient对象。

This means that the web service needs to be running in order for our test to work.
意味着测试想要正常工作，网络服务需要运行。

We need better isolation in order for the test to be reliable and repeatable.
我们需要更好地独立性，以便测试更加可靠和可重复。

Now we could use reflection in our test to change out the service reader for a test object, but the result is a test that is complicated and difficult to follow.
我们可以在测试中使用反射来改变service reader，但是结果是测试代码变得复杂以及难以维护。

I really want unit tests that are easy to read and write.
我真的很希望单元测试可以很简单的阅读的编码。

Then I'm more likely to actually use them.
遮掩我们才会更愿意去使用它们。

Our boss has come up with three pretty simple requests, the ability to access different data sources, the option of using a client-side cache, and unit testing for our code.
产品经理有三个需求，使用不同的数据源，增加可选的客户端缓存，单元测试。

The proposed solution, based on the current code, does not feel right.
现在的方案不可行。

There has to be a better way, and there is.
必须选择更好的方法，这样的方法是有的。

Our problems can be solved by breaking the tight coupling in the application.
我们的问题可能通过解耦合来解决。

By using dependency injection, we can develop loosely-coupled code, and that is exactly what we will do next.
通过使用依赖注入，我们能够开发松耦合的代码，这就是我们后面要做的。


#### Summary

In this module, we laid the foundation for the rest of the course.
在这部分课程中，我们建立后续课程的基础。

We defined dependency injection as a set of design principles and patterns that enable us to develop loosely-coupled code.
我们定义了依赖注入是设计原则和模式的集合，帮助我们开发解耦合的代码。

Some of the benefits of loose coupling include code that is easier to extend, maintain, and test.
解耦合代码的好处包括易于扩展，维护和测试。

In addition, it makes parallel development easier due to fewer merge conflicts, and it helps us follow the SOLID principles.
此外，由于避免了很多代码合并冲突，它使得并行开发变得更加容易，
There are a number of patterns that we can use for dependency injection.

我们可以有许多模式来实现依赖注入。

In the next module, we will use constructor injection and later on, we will use property injection.
下个部分我们会使用构造函数注入，再之后，还会用到属性注入。

Different patterns allow us to solve problems in different ways.
不同的模式帮助我们以不同的方式解决问题。

Dependency injection containers are an important tool in our toolbox.
依赖注入容器是很重要的工具。

They handle much of the hard work for us.
他们帮助我们处理了很多困难的工作。

After we have a good understanding of dependency injection concepts, we will be able to use the containers effectively.
在我们对依赖注入概念有了良好的理解后，我们就能够更加有效的使用依赖注入容器了。

And we will see containers in action in the last module.
我们会在最后一章演示依赖注入容器。

Finally, we looked through our sample code.
最后，我们梳理了我们的样例代码。

Even though the application is fairly simple, we had problems making our boss happy because of tight coupling.
尽管我们的应用很简单，我们还是因为紧耦合的问题，难以满足产品经理的需求

Next up, we will break the tight coupling so that we can easily make our boss happy, and more importantly, we can make our users happy as well.
下一步，我们将解耦合来使产品经理更加愉快，也使我们的用户更加愉快。



### Using Dependency Injection to Build Loosely-coupled Applications

#### Overview

In the last module, we saw that tightly-coupled code can make an application difficult to change.
在上一章中，我们看到了紧耦合会使我们的应用变得难以维护。

Now we will use dependency injection to break that coupling.
现在我们将使用以来注入来解耦合。

With loosely-coupled code, the changes are much easier.
使用解耦合代码，维护变得更加容易。

In this module, we will add dependency injection to the application.
本章中，我们将在应用中加入依赖注入。

First, we will add a bit of abstraction to loosen up the code.
首先，我们将使用抽象来解耦代码。

Then, we will use constructor injection, one of the dependency injection patterns, to create loosely-coupled code.
然后，我们会使用构造函数注入，依赖注入的一种模式，来创建解耦合的代码。

We have these loosely-coupled pieces, but we need to put them together.
我们有这些解耦合的代码，但是我们需要把他们放在一起。

This is known as object composition.
这就是对象组合。

Along the way, our code changes will help us follow the SOLID principles.
在这个过程中，我们的带改动将遵循SOLID原则。

Our boss wanted three things, the ability to change to a different data source, the option of using a client-side cache, and unit tests.
我们的产品经理有三个需求，能够使用不同的数据源，可选地使用客户端缓存，单元测试。

In the proposed solution for these requests, the code focused on the view model, the presentation logic of the application.
在之前的方案中，代码焦点在视图模型，应用的表现层。

Specifically, the problems originate in the constructor of the view model where we new up a ServiceReader.
尤其是，问题主要来自于视图迷行的构造函数，实例化ServiceReader的地方。

Because of this, we will focus on breaking the tight coupling between the view model and the presentation layer, and the service reader and the data access layer.
因此，我们将将关注于视图模型，表现层，服务读取器以及数据获取层的解耦，

If we can break this coupling, we can fulfill the boss's requests much more easily.
如果我们能够解耦，我们就能够更容易地满足产品经理的需求。

To break the coupling, we will take three steps.
我们将分三步来解耦。

First, we will loosen the coupling by adding an interface, a layer of abstraction, that will give us more flexibility.
首先，我们将添加一个接口来解耦，一个抽象层，帮助我们更加地灵活。

Then we will break the tight coupling between the view model and the service reader by using constructor injection.
然后我们将使用构造函数注入讲视图模型和服务读取器解耦。

Finally, we will take our loosely-coupled pieces and snap them together.
最后，我们将解耦的几部分代码黏合到一起。

This is object composition, and we will do this as the application starts up.
这就是对象组合，我们将在应用启动的时候做这件事。



#### The Repository Interface

Let's think about the different data sources that we want to use.
让我们来思考下我们要使用的不同数据源。

We want to be able to connect to whatever data store we need.
我们想要连接任何我们需要的数据源。

For this, we can use the repository pattern, and in fact, we are already using it.
为此，我们可以使用仓储模式。

The repository pattern mediates between the domain and data mapping layers using a collection-like interface for accessing domain objects.
仓储模式作为domain和数据映射层的媒介，使用类似集合的接口来获取domain对象。

Let's understand what this means by looking at the current application.
让我们来看下应用程序来理解这是什么意思。

The repository separates the application from a specific data storage technology.
仓储将应用程序从特定的数据存储技术分割出来。

The idea is that the repository knows how to communicate with the data store whether it is using HTTP, reading a file from the file system, or making a database call.
仓储的思想是知道如何和数据源沟通，不管是HTTP，文件系统上的文档，还是数据库访问。

It then takes the data that comes back and turns it into normal C# objects that the rest of the application can understand.
然后获得这些数据，并转换成应用程序其他模块可以使用的C#对象

This is exactly what the service reader does now.
这也是服务读取器现在干的事情。

It makes an HTTP call to the web service, then parses the JSON result into Person objects that the application can use.
它对网络服务发起了一个HTTP请求，然后将JSON格式的结果转换成应用程序可以理解的People类对象

Right now, the view model in the presentation layer directly interacts with the service repository that we have in the data access layer.
现在，表现层的视图模型与数据获取层的服务仓储直接交互

To make our application more flexible, we will add an interface for the repository.
为了我们的应用更加地灵活，我们给仓储加上接口。

All communication with the presentation layer will be through that interface.
所有在表现层的通信都将通过通过这个接口实现。

With the abstraction in place, the presentation layer can just as easily communicate with a CSV repository or with a SQL repository.
有了抽象，表现层就可以很容易地与CSV或者SQL仓储通信。

Many times, the repositories we use are CRUD repositories, where CRUD stands for create, read, update, and delete.
很多时候，我们使用的仓储是CRUD仓储，CRUD代表create, read, update, 以及delete。

We do not need all of these operations however.
然而，我们不需要所有这些操作

The interface segregation principle says that interfaces should only contain what the client needs.
接口分离原则告诉我们接口应该只包含需要的功能。

A full repository generally has both read and write operations.
一个完整的仓储通常有读写的操作。

But our client, the view model, only needs read operations.
但是我们的应用，视图模型只需要读操作。

So to follow the interface segregation principle, we should only have read operations on a repository interface.
因此为了符合接口分离原则，我们的接口应该只使用读操作。

For that reason, we will create a data reader interface called IPersonReader.
基于此，我们将创建一个数据读取接口，IPersonReader。

We will use the term, data reader, rather than repository from now on even though our data reader fulfills the same purpose.
从现在开始，我们将使用术语，数据读取，而不是仓储，尽管我们的数据读取满足同样的目的。

The interface has a method for GetPeople which will return all of the Person objects, and it also has a GetPerson method to retrieve an individual person.
借楼包含了一个GetPeople函数，返回所有的Person对象，还有一个GetPerson方法检索个人信息。

Let's go to the code and add the interface.
让我们在代码里加上这个接口。



#### Demo: Loosening Coupling with an Interface

We will start by loosening the coupling between the view model and the service reader.
我们开始对视图模型和服务读取器解耦。

We will do this by adding the data reader interface that we just saw.
为此，我们添加数据读取接口。

So let's flip over to Visual Studio and get started.
让我们回到 Visual Studio。

In the PersonDataReader.Service project, let's open up the ServiceReader class.
在 PersonDataReader.Service 工程中，我们打开类 ServiceReader。

The ServiceReader class has two methods, GetPeople and GetPerson.
类 ServiceReader 有两个方法 GetPeople 和 GetPerson。

These are the methods that we want in the interface.
这是我们在接口中需要的两个方法。

Let's add the interface to the PeopleViewer.Common project so that we can easily share it.
在工程 PeopleViewer.Common 中添加接口 IPersonReader，以便能够方便的共享。

Let's right-click on the project, say Add, Class, choose Interface, and name it IPersonReader.

This will be a public interface that has two members.
这是包含了两个成员的共有接口。

The first returns an IEnumerable of Person, and it's called GetPeople.
第一个返回 Person 类型的 IEnumerable 对象，函数名 GetPeople。

A second just return a Person object, we'll call this GetPerson, and it takes an integer ID as a parameter.
第二个返回Person对象，函数名GetPerson，以int型的变量ID为入参。

Finally, we'll just clean up the code a little bit by saying Remove and Sort Usings.

Now that we have this interface, we can go back to the ServiceReader class and see that it implements IPersonReader.
让 ServiceReader 继承接口 IPersonReader。

If we build at this point, we get a successful build.

We did not need to make any changes to the service reader because the methods are already there.

Now that we have this, let's head to the view model in our presentation layer and loosen up the coupling.
让我们回到 表现层的ViewModel, 进行解耦。
So we'll go to the PeopleViewer.Presentation project, and open up the PeopleViewModel.

Now we can change our field from type, ServiceReader to IPersonReader.
现在我们可以将类成员变量 ServiceReader 改为 IPersonReader 了。

And if we build our code, we see that it still builds successfully.

The RefreshPeople method is happy because the IPersonReader interface has a GetPeople method, and that's what we need to call here.
RefreshPeople 方法不用做任何修改，因为接口 IPersonReader 包含了 GetPeople 方法。

But this only loosens up the coupling a little bit.
但这只是解耦了一点点。

What we really need is to get rid of the new ServiceReader in the constructor, and that's what we'll do next.
我么你需要的是 避免 在构造函数中实例化 ServiceReader。



#### Demo: Breaking Coupling with Constructor Injection

Now we'll break the tight coupling between the view model in the presentation layer and the service reader in the data access layer.
现在我们准备解耦表现层的ViewModel 和 数据获取层的 service reader

We'll do this by injecting the data reader into the view model, then, we'll inject the view model into our view, and then we'll snap our loosely-coupled pieces together as we compose our objects.
我们通过注入data reader 到 ViewModel，注入viewmodel 到view，然后我们再将这些对象组合到一起。

So let's look at the code.

We are still in the PeopleViewModel class.

In the constructor of the view model, we really do not want to new up a ServiceReader.
在 view model 的构造函数中，我们不希望实例化 ServiceReader。

Picking the data source is not the responsibility of the view model.
选取数据源不是view model 的职责。

So, let's make it someone else's responsibility.

We'll do this by adding a parameter on the constructor.
所以我们给构造函数价格参数。

So we'll pass in an IPersonReader that will call dataReader, and then we'll assign that to our dataReader field that we have.
我们通过这个参数 将 具体的数据读取对象 传递给 viewmodel的 成员变量IPersonReader。

I know that it looks like we just added a parameter, but we are now doing dependency injection.
虽然看上去就是加了一个变量，但是这就是依赖注入。

We have not eliminated any dependencies.
我们还没有消除依赖。

We still have a dependency on an IPersonReader.
我们仍然依赖于 IPersonReader。

We need it to call the GetPeople method.
我们需要他调用 方法 GetPeople。

But instead of managing the dependency ourselves, we inject the dependency through the constructor, and that's why this pattern is known as constructor injection.
但是viewmodel不再需要管理依赖对象，我们通过构造函数注入了依赖，这就是为什么这个模式叫做构造函数注入。

If we build at this point, we get a build failure.
这时候编译通不过。

And if we follow this error, we end up in the constructor of our view.
根据错误提示我们定位到view的构造函数。

In the constructor, we're trying to new up a PeopleViewModel with a no-parameter constructor, but we no longer have a no-parameter constructor.
在这个构造函数中，我们试图用无参构造函数实例化 PeopleViewModel。但是现在没有这样的构造函数了。

Our constructor now needs an IPersonReader.
构造函数需要一个 IPersonReader 类型的参数。

Now we could come here and say, var dataReader = new ServiceReader, and then pass that through to the constructor.
我们可以在这里实例化 ServiceReader ，然后传递给 viewmodel的构造函数。

But if picking the data source is not the responsibility of our view model, it's really not the responsibility of our view.
但是如果选取数据源不是viewmodel 的职责，显然也不是 view 的职责。

Again, our view is strictly the UI elements of our application.

So how do we resolve this? Well, let's make it someone else's problem.
那么如何解决呢？ 让我们把这个问题丢出去。
So whoever creates a PeopleViewerWindow has to supply us with a PeopleViewModel as well.
所以不管谁创建了 PeopleViewerWindow 对象都应该也提供一个 PeopleViewModel对象。

And we can use that parameter to set our class-level field.
然后我们可以使用这些对象对类成员变量赋值。

Now one thing to note about this is that I did not create an interface for the view model.
有件事注意下，这里我没有给 view model 创建接口。

I generally like to add abstractions only when I need them just because they do add a layer of complexity and indirection to our code.
通常我们只在需要的时候添加接口，因为接口增加了一层复杂性以及对代码进行了重定向

In my experience, the relationship between views and view models is generally one to one, so I don't mind the concrete reference here.
凭我的经验，view 和 viewmodel 之间的关系大多是一对一的，因此我不介意在这有具体类的耦合。

If I did have a need for multiple view models to work with the same view, then I'd go ahead and add an interface at that point.
如果我确实需要将多个viewmodel绑定到同一个view，那么我会先添加一个接口。

Now if we build at this point, we do get a successful build.
现在编译能够通过了。

===============>  以下不重要。
But if we try to run our application, we end up with a runtime error.
但当我们试图运行应用程序时，我们会获得一个运行时错误。

And this is every developer's favorite exception.
这是每个开发最喜欢你的异常。

Object reference not set to an instance of an object.
对象引用没有绑定对象实例。

And notice the code that it's pointing to.

Yes, that's right.

It's not actually pointing to code.

Now with my experience using XAML with WPF, I know that this points to a problem in the markup.

Fortunately, Visual Studio has gotten better because we can get a better error message than this.

Let's go ahead and stop debugging, and then do a clean and rebuild of our solution.

Now when we run our application, we'll see we still get a runtime error, but we get one that's much more informative.

In this case, it's a XamlParseException.

No matching constructor found on type PeopleViewer.PeopleViewerWindow.

Now, since we just changed the constructor of the PeopleViewerWindow, this error makes a lot of sense, but now we have to figure out how to fix it.

And for this, we need to go to the Application class of our PeopleViewer project.

So if we open up PeopleViewer, we see that there's an App.xaml file.

This represents the application itself, and this is what is used when the application is starting up.

Now notice in the Application tag, there's a property for StartupUri that says PeopleViewerWindow.xaml.

This tells the application what the main window of the application is going to be.

Now when we have a startup URI like this, it tries to create the PeopleViewerWindow object using a no-parameter constructor.

Well we got rid of the no-parameter constructor, and that's why this line of code is failing.

Now the first thing I do whenever I come across a line of code that doesn't work is I delete it.

And if we do this and build our application, we see that we do get a successful build.

And if we run our application, we see that we get no runtime errors.

Okay, so we don't have a main window for our application either, but no runtime errors is good, right? Now obviously, we need to fix this.

And what we're going to do is take over the startup manually.

Now just like our forums have markup and code-behind in WPF, our App.xaml has code-behind as well.

And in the code-behind, we'll go ahead and override the OnStartup method.

And there's really two things that we need to add.

We need to take the Application.Current .MainWindow, and set it to a new PeopleViewerWindow.

And then we need to take that main window, and show it.

So this is the code that runs when we use the StartupUri in the App.xaml.

Now we see that the PeopleViewerWindow constructor's not happy, and that's because it needs a PeopleViewModel instance as a parameter.

So let's go ahead and create one.

So we'll say var viewmodel = new PeopleViewModel, and notice that we aren't getting any IntelliSense here.

If I press Ctrl+dot, it'll bring up the option to add a using statement at the top of our file.

So let's go ahead and do that.

And then we'll just take this view model and pass it through to our PeopleViewerWindow.

Now our PeopleViewModel constructor is not happy at this point because it wants an IPersonReader.

So let's go ahead and create that.

So we'll say var reader = new ServiceReader, and again, I'll use Ctrl+dot here, and this will bring in both an assembly reference and a using statement at the top of my file.

So I can new up that ServiceReader, and then pass it through to the constructor of the view model.

And what I'm actually doing here is taking our loosely-coupled pieces and snapping them together.

At this point, we can build our application and we get a successful build, and we can run our application and see that we no longer get runtime errors.

Now I have already started the service, like we saw previously, so I can click on the Fetch People button, and we see that we get data in our list box.

There's just a few more minor changes that I want to make to the application.

First, notice that the title bar, it says Tight Coupling.

I actually want to change that.

So we'll set our Application.Current .MainWindow .Title to With Dependency Injection.

And the other thing that I'm going to do is extract the code that is snapping the loosely-coupled pieces together.

And for that, I'll just use Ctrl+dot, and you'll see Extract Method pops up, and we'll call this ComposeObjects because that's exactly what we're doing here.

And we can run our application and see that we have the new title, With Dependency Injection, and we're getting data from our service reader.

So what we have done here is break the tight coupling between our view model and our data reader by using constructor injection.

The view model still has a dependency.

We need to call a GetPeople method on a DataReader.

But instead of dealing with that dependency directly by newing it up, the dependency is now injected as a constructor parameter.

With the loosely-coupled pieces in place, we need to assemble them somewhere, and we do that at application startup in our ComposeObjects method.

Now all of these changes may seem a bit disappointing because we have exactly the same functionality that we had in the tightly-coupled application.

But as we will see, the code is in much better shape now.

We will be able to quickly and easily satisfy the boss's request based on the dependency injection that we have in place right now.


#### What is a Bootstrapper?

The application is in pretty good shape at this point.
现在，应用程序已经很不错了。

We have broken the tight coupling, and then composed the loosely-coupled pieces at application startup.
我们解耦合了代码，并将解耦合的模块在应用程序启动时组合起来。

But right now, the object composition code and the UI code, our view, are in the same project.
但是现在，对象组合的代码和UI 的代码在同一个工程。

Before moving on to make our boss happy, I want to add one more piece, a bootstrapper.
在我们继续后续内容之前，我们添加一个 bootstrapper

The bootstrapper is responsible for starting up the application.
bootstrapper 负责启动应用程序。

This is where we will compose the objects.
这是我们组合对象的地方。

The view will be moved into its own project.
view 会被移入单独的工程。

This is a very common architecture for larger applications.
这是大型应用程序很常见的架构

And the reason I'm doing it here is so that we can share the view with multiple bootstrappers later on in the course.
我在这里这么做的原因是我们能够将view 分享 给多个 bootstrapper。




#### Demo: Adding a Bootstrapper

Now we'll head back to our code.

This time, we'll add a bootstrapper to our application, and we'll do this to separate the object composition from the UI.
我们将添加一个 bootstrapper 到我们的应用，以便将对象组合部分的代码和UI代码区分开来。

Back in Visual Studio, the changes that I want to make are to the PeopleViewer project.

Since this already has all of my application startup code, I'm going to keep this project and turn it into the bootstrapper.

The view that we have in this project is the PeopleViewerWindow.

We'll take this view out of this project and put it into a separate view project.
我们将 PeopleViewerWindow 移出来放到单独的工程。

So let's do a little bit of housekeeping first.

I'm going to take this View folder that we have in the Solution, and rename it to Bootstrapper.

Then I'll create a new solution folder to hold the views.

And in here, we'll just add a new project.

And for this, we want a WPF User Control Library, and we'll name this PeopleViewer.View.

Since our view uses the view model, we'll go ahead and add a reference to the PeopleViewer.Presentation project, as well as the PeopleViewer.Common project.

Next, we'll delete the UserControl1.xaml because we do not need this for our application.

Instead what we'll do is we'll copy the PeopleViewerWindow from our Bootstrapper project, and paste it in to the PeopleViewer.View project.

Now that it's in the new View project, we can remove it from the Bootstrapper.

And the last step is to add a reference to the View project that we just created so that our bootstrapper knows about it.

So we'll just include a reference for our PeopleViewer.View.

So what we've done is created a new PeopleViewer.View project that will hold our WPF windows.

The PeopleViewer project itself is now a bootstrapper.

It's responsible for starting up the application, and part of that is composing the objects.

If we build and run the application, we'll see that the behavior is still the same.

In future samples, we will have multiple bootstrapper applications.

This will let us experiment with different ways of composing our objects while still using the same View project and, of course, it will also use the same Presentation and DataAccess projects as well.




#### Summary

In the view model, we added a parameter to the constructor, but we also added dependency injection.
在viewmodel中，我们给构造函数增加了一个参数，同时增加了依赖注入。

Our view model has a dependency on an IPersonReader.
我们的view model 依赖于 IPersonReader。

We have the dependency because we need to call the GetPeople method on that IPersonReader.
我们建立此依赖，因为需要调用 接口 IPersonReader的GetPeople 方法。

But instead of dealing with the dependency ourselves, we inject the dependency through the constructor.
我们通过构造函数注入依赖，而不是在内部处理依赖。

We do not eliminate the dependency.
我们没有消除依赖。

We just control how we get access to it.
我们只是控制了我们怎么处理依赖。

And by adding it to a constructor parameter, we make it someone else's responsibility.
通过添加构造函数参数，我们把处理依赖的部分丢出去了。

This is the dependency inversion principle in action.
这就是依赖注入起效的方式。

The view model is no longer responsible for getting or managing the lifetime of the dependency.
viewmodel 不再 负责依赖对象生命周期的管理。

Instead, the dependency, the data reader, is given to the view model to use.
而只是使用依赖对象。

And by doing this, we break the tight coupling between the view model in our presentation layer and the service reader in the data access layer.
通过这个步骤，我们解耦合了表现层的viewmodel 和数据获取层的 service reader。

And this gives us the flexibility that we need to move forward.
这给了我们进一步开发的灵活性。

In the last module, we saw how the original code violates the single responsibility principle, but this has changed.
在上一章，我们看到了原始代码违反了单一职责原则，

The view model no longer picks the data source to use by newing up a specific DataReader, the view model is no longer responsible for the lifetime of the data reader, and the view model will not decide whether to use a client-side cache.
viewmodel 不再通过实例化datareader来选择数据源，不再负责datareader 的生命周期，也不再决定是否使用客户端缓存。

And we'll see this code in the next module.

Our view model is now responsible for the presentation logic providing methods that can be called from the UI and a property that can be data bound to the UI.
viewmodel 现在只负责表现层的逻辑，提供UI能够调用的方法和绑定的数据。

It truly has a single responsibility.
真正做到了单一职责。

We also learned about object composition.
我们也学习了对象组合。

When we have the loosely-coupled pieces, we need to snap them together somewhere.
当我们有了解耦合的模块，我们需要在某个地方将他们组合到一起。

In the sample code, that is in the ComposeObjects method that gets called at application startup.
在示例代码中，在应用程序启动时 方法 ComposeObjects 组合了对象 

This method creates an instance of a data reader, a ServiceReader in this case.
方法实例化了一个datareader对象。在这里是serviceReader

Then it creates an instance of the viewModel passing the data reader as a parameter.
实例化了viewmodel 对象，以datareader对象作为参数。

Then it creates an instance of the view passing the viewModel as a parameter.
实例化了view对象，以viewmodel 对象为参数。

This is how we assemble the main window that this application needs.
这是我们集成主界面的方式。

In this module, we added some abstraction by creating an interface for our data reader.
在这个模块中，我们利用datareader接口添加了抽象层。

Then we used constructor injection on the view model to inject the data reader.

We also used constructor injection on the view to inject the view model.

Then we snapped the loosely-coupled pieces together at application startup.

This is known as object composition, and this is where we get enormous flexibility, as we'll see in the next module.

Along the way, the code followed the SOLID principles.

The interface contains just the functionality that the client needs following the interface segregation principle.

The view model relies on someone else to provide the data reader dependency following the dependency inversion principle.

And the view model is reduced to a single function, the presentation logic, following the single responsibility principle.

Up next is my favorite part.

This is where we get to make the boss happy.

And with loosely-coupled pieces in place, we can do this very easily.


### Taking Advantage of Loose Coupling

#### Overview

We have spent a bit of time adding dependency injection to the application.
我们花了不少时间再应用程序中加入依赖注入。

We injected dependencies through constructors, and then composed the objects at the application startup.
我们通过构造函数注入依赖，然后在启动应用的模块将对象组合起来。

The functionality of the application is still the same, but that is all about to change.
应用的所有功能还是一样，但这就是更改的全部。

This is my favorite part because this is where we get to start making my boss happy, and hopefully the users will be happy too.
这是我最喜欢的部份，因为此刻开始我开始让我的老板和客户变得高兴。

Now that the code is loosely coupled, we can extend the application very easily.
现在代码已经解耦了，我们能够很容易地扩展应用。

In this module, we focus on using dependency injection to our advantage.
在本章中，我们重点看依赖注入带给我们的益处。

We will change the data readers in the application so we can access different data sources, we will get data from a text file, and we will get data from a SQL database.
我们将更改应用中 data readers，从而从不同的数据源获取数据，我们将从文本文件获取数据，或者从数据库获取数据。

After that, we will add a client-side cache.
之后，我们将增加一个客户端缓存。

This will keep the data in memory so that we do not need to go back to the data source on each request.
我们将在内存中保存数据，以避免我们每次请求都访问数据源。

Along the way, we will see how this code follows the SOLID principles.
同时，我们将看到代码是如何遵循SOLID原则的。

As a reminder, my boss wanted three things updated in the application.
作为提醒，我的老板需要在应用中更新三件事。

We want to access different data sources so each client can keep whatever data source they currently have, we also want a client-side cache to reduce the number of network calls, and we want to add unit tests.
我们想要访问不同的数据源，以便每个客户端能够满足不同的数据源需求，我们也希望有客户端缓存来减少网络请求次数，我们想要增加单元测试。

We will focus on the first two requests here.
这里我们将重点看前面康哥需求。

The next module will deal with unit testing.
下一章会讲单元测试的内容。

So, let's get started.
让我们开始吧。


#### Different Data Sources

The current application gets data from a web service, but we want to be able to get data from an arbitrary data source.
目前我们的应用能够从web服务获取数据，但是我们还希望它能够从任意的数据源获取数据。

We will add two new data sources, one to access a text file and one to access a SQL database.
我们将增加两种数据源，一个是访问文本文件，一个是访问数据库。

The steps for adding a new data source are pretty easy.
增加新数据源的步骤很简单。

Step one is to create a new data reader that implements the interface.
第一步是创建一个实现接口的 data reader。

Step two is to snap the pieces together in a different order.
第二步是将不同的代码片段以不同地顺序黏合起来，

Once everything is built, we will unplug the service reader, and plug in the CSV reader.
一旦完成，我们将移除 service reader， 加上CSV reader。


#### Demo: Adding a Text File Data Reader

To get data from a text file, we will add a text file data reader, and then snap the pieces together in a different order.
要从文本文件获取数据，我们将增加一个文本文件的 data reader， 然后将各部分重新组合。

Let's head over to the code and do just that.
让我们回到代码开始修改。

Here we are back in Visual Studio.
我们回到 Visual Studio。

We're going to add an existing project to our DataAccess folder.
我们将添加一个现有项目到 DataAccess 文件夹。

So I'll right-click, say Add, Existing Project, and then we'll navigate to PersonDataReader.CSV and bring in that project.
我们导入 PersonDataReader.CSV 工程。

The CSVReader has the functionality that we need.
CSVReader 有我们需要的功能。

Let's go ahead and collapse to definitions so we can see what's going on here.
略

So we'll just go to Outlining, Collapse to Definitions.
略

And the first thing to notice is that the CSVReader does implement the IPersonReader interface, so our view model will be able to use this exactly like the service reader.
首先，CSVReader 实现了 IPersonReader 接口，因此我们的 view model 能够像使用 service reader 一样使用它。

And because it implements that interface, it has both GetPeople and GetPerson methods.
由于 它实现了 IPersonReader 接口，所以有方法 GetPeople 和 GetPerson。

If we take a quick look at the implementation code, we can see that this loads a file using a separate FileLoader object.
如果我们快速的看下实现代码，我们会发现它使用一个 FileLoader 对象加载文件。

This method uses a StreamReader to load data off of a file system.
这个方法使用 StreamReader 从文件系统加载文件。

Once that data comes back, it's parsed into Person objects.
一旦数据返回，它就将数据解析到 Person对象。

And we can see the ParsePersonString method actually takes a comma-separated string, splits it up into different elements, and returns a Person object.
略

These Person objects are collected so that the GetPeople can return an IEnumerable of Person objects.
略

So we have a CSV reader that can parse data off of the file system and return it as Person objects.
所以我们有一个 CSV reader能够解析文件系统读取的数据并返回Person对象。

In order to use this in our application, we just have to compose our objects differently.
为了能够在应用中使用，我们只需要重新组合我们的模块。

So let's go back to the bootstrapper application.
所以让我们重新回到 bootstrapper 工程。

The first thing I'll do is I'll add an assembly reference to the PersonDataReader.CSV project that we just brought in.
首先我们需要引用 PersonDataReader.CSV 工程。

Now we'll go to our App.xaml.cs file and compose our objects differently.
然后在 APP.xaml.cs 文件中重新组合模块。

In order to use the CSV reader, all we have to do is compose our objects in a different order.


So instead of newing up a ServiceReader, we'll new up a CSVReader, and I'll just use Ctrl+dot to bring in a using statement for that assembly.
我们实例化一个 CSVReader 来替代 ServiceReader。

Now we can build and run our application and when we click on the Fetch People button, we get data from a text file.
现在我们能够运行我们的应用，点击 Fetch People 按钮，我们从文本文件获取到了数据。

Now there's two ways we can tell data's coming from the text file.
我们有两种途径知道数据来自文本文件。

First of all, at the bottom, we see it says PersonDataReader.CSV.CSVReader.
首先，在底部我们看到 PersonDataReader.CSV.CSVReader.

But more importantly, the text file has an additional record, Jeremy Awesome.
但更重要的是，文本文件有一个额外的记录，Jeremy Awesome。

So I can tell just by looking at the data that we are getting data from a different data source.
因此通过数据内容我们能够知道数据来自不同的数据源。

The text file itself is on the file system.
略

So if we go to our Solution folder, and open that in File Explorer, there's an AdditionalFiles folder, and this has a People.txt file.
略

If we open that up, then we see we do have comma-separated values that represents our data.
略

The way our CSV reader is currently configured, it looks for that file in the same folder as the executable.
略

To get the file over there, we have a post-build event on the PeopleViewer project, our bootstrapper.
略

So we if we look at the project properties, and then go to Build Events, we actually have a post-build event that copies everything from the AdditionalFiles folder into the target directory, which is where our executable will be.


Now we can expand our CSV reader if we want to and have it pick up a file in an arbitrary location.


This is just the way we have things set up right now.


Adding a new data reader was very easy.
增加一个新的 data reader 很容易。

We just had to create a new CSV reader that implements the IPersonReader interface, and then we compose our objects in a different order.
我们只需要创建一个新的 实现 IPersonReader 接口的 CSV reader，然后重新组合模块。

So instead of newing up a ServiceReader, we new up a CSVReader and snap our pieces together a little bit differently.
略。

To do this, we do not need to change the view, the view model, or any existing data readers.
我们不需要改变view， view model， 以及任何现有的 data reader。

That is pretty powerful.
这真的很强大。

Next, we'll do the same thing to get data from a SQL database.
下面我们将同样的从数据库获取数据。


#### Demo: Adding a SQL Database Data Reader
略

To get data from a SQL database, we add a SQL data reader, and then we snap the pieces together in a different order.


This is very similar to what we did to add the CSV reader.


Let's go to the code and take a look at that.


So let's go to our DataAccess folder and add an existing project.


This time, we'll find the PersonDataReader.SQL project and bring that one in.


So let's go to our SQLReader class and take a look at that.


And again, we'll go ahead and collapse to definitions so we can get a good overview.


The SQLReader implements IPersonReader, so it has the methods, GetPeople and GetPerson, and it will plug in to our view model just like our other data readers.


This implementation code works a bit differently.


Rather than opening a text file on the file system, this uses a SQL database.


The GetPeople method uses Entity Framework to get data out of a database and return it as an IEnumerable of Person.


One thing to note here is that the data is coming from a SQLite database that exists on the file system.


I did this so you could easily build and run the application without having to have a separate SQL Server somewhere, but we could just as easily change the connection and get data off a SQL Server on the network.


Using this in the application is just like with our CSV reader.


We'll go to our bootstrapper application, and add a reference to the project that we just brought in, and that's the PersonDataReader.SQL project.


Now we just need to compose our objects a little differently.


So in our App.xaml .cs where we composed the objects, instead of using the CSVReader, we'll use the SQLReader.


And again, I'll use Ctrl+dot to bring in the using statements for that.


When we build and run the application at this point, we can click the button and get data from that SQL database.


And we can see the type down at the bottom is PersonDataReader.SQL .SQLReader.


So to get data from a SQL database, we just need to create a SQLReader class that implements the IPersonReader interface, and then we snap our pieces together in a different order in the ComposeObjects method.


We do not need to change the view, view model, or any existing data readers.


And as you might guess, by using this formula, we can create as many data readers as we'd like and easily snap them into the application.



#### The Decorator Pattern and Client-side Caching

Our second request is for a client-side cache.
我们的第二个需求是增加客户端缓存。

We could add the caching code directly into our data readers, but there is a better approach for our scenario, the decorator pattern.
我们可以在 data reader 中直接增加数据缓存的代码，但是在目前的场景中，我们有更好的方式，装饰者模式。

The decorator pattern is a way to wrap an existing interface to add functionality.
装饰者模式一种通过包装现有接口来增加功能的模式。

The idea is that we wrap an existing data reader, add the caching functionality, and then expose the same data reader interface to the outside world.
思路是我们包装现有的 data reader，增加数据缓存功能，然后输出这个 data reader 接口 给其他调用者。

Our service reader implements the IPersonReader interface.
我们的 service reader 实现了 IPersonReader 接口。

We take that service reader and wrap it in a caching reader.
我们获取 这个 service reader 并将它包装在一个 caching reader 里。

This adds the caching functionality that we need.
这样就增加了我们需要的数据缓存功能。

The caching reader is also an IPersonReader, so it looks just like any other data reader to the rest of the application.
caching reader 同样是个 IPersonReader，所以对应用的其他部分来说他就像其他的 data reader 一样。

By using a decorator, we can wrap any of our existing data readers.
通过使用装饰者模式，我们能够包装任何一个现有的 data reader。

We use constructor injection with the caching reader to inject the real data reader that it wraps.
我们在 caching reader 上使用构造函数注入 来注入真正的 data reader。

This means that to add caching, we just need to snap our pieces together in a different order.
这意味要着增加缓存功能，我们仅仅需要重新组合模块。

Instead of the view model in the presentation layer connecting directly to the service reader, the view model connects to the caching reader, and the caching reader connects to the service reader.
view model 连接 caching reader，而不是直接连接 service reader，caching reader 连接着 service reader。

This will make more sense once we see it in code.
在代码里我们会看的更加清楚。

So, let's head over to the code.
所以，让我们回到代码。


#### Demo: Adding a Client-side Cache

To add client-side caching, we will use a caching reader, a decorator that implements the IPersonReader interface and wraps an existing data reader.
要添加客户端缓存，我们使用 caching reader，一个实现了 IPersonReader 接口的装饰器并且包装了现有的 data reader。

Once we have this, we snap our pieces together in a different order.
有了 caching reader，我们再重组我们的模块。

Let's go look at the code.
让我们看下代码。

Back in Visual Studio, we'll bring in another existing project.


So I'll go to the DataAccess folder, right-click, and say Add, Existing Project, and then navigate to the PersonDataReader.Decorators project.
我们添加现有工程 PersonDataReader.Decorators。

This has our caching reader in it.
里面包含了 caching reader。

Let's go ahead and collapse to definitions so we can get an overview of what this class does.


The first thing to note is that CachingReader implements the IPersonReader interface, so it does have the methods, GetPeople and GetPerson.
首先，CachingReader 实现了 IPersonReader 接口，所以包含了方法 GetPeople 和 GetPerson。

Up at the top of the class, we have a private field, _wrappedReader, which is an IPersonReader.
我们有一个私有成员变量 _wrappedReader，一个 IPersonReader 类型变量。

This is the real data reader that we want to wrap and add the caching functionality to.
这是我们想要包装并添加缓存功能的真正的 data reader。 

If we look at the constructor, we can see that we're using constructor injection to get this wrappedReader into our class.
看下构造函数，我们发现它通过构造函数注入获取了 wrappedReader。

The other fields that we have on the class control the cache.
其他类成员用来控制缓存。

The TimeSpan cacheDuration tells how long our cache should be kept in memory.
TimeSpan 类型的 cacheDuration 对象用来判断缓存在内存中保留的时间。

In this case, we're setting it to 30 seconds, but we can configure this however we'd like including getting a value from configuration.
这里我们设置了30秒，但是我们可以通过配置文件来修改它。

The other two fields have to do with the cache itself.
其他两个变量和缓存本身有关。

The cachedItems field is an IEnumerable of Person, and this is our in-memory cache.
cacheDuration 变量是一个 Person 类型的 IEnumerable 对象，这就是我们内存中的缓存。

The dataDateTime field contains the time that the cache was last updated, so we can use this to calculate whether the cache is valid or if it's expired.
dataDateTime 变量包含了缓存更新的上一次时间，因此我们能够通过这个变量来判断我们的缓存是否有效或者过期。

If we look at the GetPeople method, there's a two-step process.
如果我们看下 GetPeople 方法，会发现有两个处理步骤。

The first thing it does is validate the cache.
第一个是验证缓存。

If the cache is expired or empty, it will go to the wrapped reader to fetch data and put it into the cachedItems field.
如果缓存过期或者没有缓存，它就会通过包装的 reader 来获取数据，并且保存到 cachedItems 中。

If the cache is still valid, then it will just use what's already in memory.
如果缓存有效， 那么就直接使用缓存。

This is a fairly naive implementation of client-side caching, and I'll let you go through the code on your own if you're interested in the details.
这只是简单的客户端缓存实现方式，感兴趣的话你可以自己看下代码。

Now to use this client-side caching, we just have to snap our pieces together in a different order.
现在为了使用客户端缓存，我们仅仅需要重组代码。

So let's go back to our bootstrapper application and add a reference to the caching reader that we just brought in.
我们回到 bootstrapper 工程，引用 PersonDataReader.Decorators。

So I'll say Add Reference to PersonDataReader.Decorators.


And now let's go to our ComposeObjects in our App.xaml.cs file and snap things together a little differently.
在 App.xaml.cs 中，

In this case, instead of using a SQLReader, we'll use the CachingReader.
我们使用 CachingReader 替换 SQLReader。

And again, we'll use Ctrl+dot to bring in the using statement for that.


Now the CachingReader constructor does have a parameter, which is an IPersonReader, that it can wrap.


For this demo, we'll create a service reader since that's easier to demo.
这里为了掩饰方便，我们包装 service reader。

So we'll create a wrappedReader, and we'll new up a ServiceReader, and then we'll pass that to the CachingReader.
我们实例化 ServiceReader 并且作为参数传递给 CachingReader 构造函数。

So you can see what we're doing is we're simply snapping our loosely-coupled pieces together in a different order.
所以你会看到我们只是简单的重组了代码。

The first thing we'll do is we'll flip over to the command line for our service and use dotnet run to start the service.
我们先运行web服务。

Now let's go back and run our application.
然后运行我们的应用。

When we click on the Fetch People button, we do get data from the service.
点击 Fetch People 按钮，我们得到了数据。

And now what we can do is go back to the service and stop it with Ctrl+C.
现在我们关闭web服务。

Now, our web service is no longer running.


But we can click the Clear Data button and the Fetch People button, and we still get data.
然后清空应用的数据，我们依然能够获取到数据。

That's because we're using that 30 second client-side cache, and we can keep clicking these buttons until the cache expires.
因为我们使用了30秒的缓存，我们继续几点按钮知道缓存失效。

Now 30 seconds seems like a long time, but sometimes when I set that value to a shorter number, I don't have enough time to actually show it in action.


Well now we can see that the cache is expired and the caching reader is trying to refresh data from the service.
我们能够看到缓存失效了，并且caching reader试图从web服务获取数据。

Since the service is not there, an exception is thrown.
但是web服务已经关闭了，所以抛出了异常。

In this case, the caching reader is designed so that if it cannot access the real data reader, it will return a No Data Available record.
这个例子中，如果 caching reader 不能够获取数据，就返回一个空的记录。

And we can actually go back to our service and restart it with dotnet run.
我们重启web服务。

And then in our application, we'll see that our FetchPeople method is working once again.
在我们的应用中重新获取数据，有正常工作了。

So we've actually seen a client-side cache in action, and all we had to do was snap our loosely-coupled pieces together in a different order.
因此我们看到了一个真实的客户端缓存示例，我们要做的就是重组代码。

And if we go back to our code, we could add this client-side caching without changing our view, without changing our view model, and without changing any of our existing data readers.
我们回头看下代码，发现我们增加了客户端缓存功能，但是没有修改view， 没有修改view model，没有修改现有的 data reader。

We just snap the pieces together in a different order.
我们只是重组了代码。


#### Summary

In the code, we got to see the real power of dependency injection and loosely-coupled code.
在代码里，我们看到了依赖注入和解耦合代码的强大。

When we add a new data reader to the application, the view model does not change.
当我们增加一个新的 data reader，view model 没有修改，

The view does not change.
view 也没有修改。

We snap our loosely-coupled pieces together in a different order.
我们重组了模块。

Here's the code where we composed the objects.
就在这段代码里。

In the original code, we create a service data reader to pass to the view model, and then we pass the view model to the view.
在原来的代码基础上，我们创建了 service data reader 并传递给 view model，然后我们传递 view model 给 view。

To switch to the CSV data reader, we create the CSV reader and pass it to the view model, and then we pass the view model to the view.
为了切换到 CSV data reader，我们创建了 CSV reader 并传递给了 view model， 然后将 view model 传递给了 view。

The only place that needs to change in the application is the object composition.
在应用程序中唯一修改的就是对象重组部份的代码。

Everything else remains the same.
其他部份都一样。

We can make as many data readers as we want, and the object composition is the only change needed.
如果需要，我们能够创建更多的 data reader ，并且只需要修改对象重组的部份代码。

For our scenario with different clients, it would make a lot of sense to choose which data reader to use at runtime.
在我们场景中，针对不同的客户端，想要在运行时决定用那种 data reader，这是很有意义的。

We will see that in the last module when we look at late binding.
我们将会在最后一章中的延迟绑定看到。

To add a client-side cache, we created a decorator to add functionality to any existing data reader.
为了增加客户端缓存，我们创建了一个装饰器，来给现有的 data reader 增加功能。

The view model does not change, the view does not change, and all of the existing data readers do not change.
view model 没有做修改，view 也没有做修改，所有现有的 data reader 都没有做修改。

We just snap the pieces together in a different order.
我们只是组合了不同的对象。

The only thing that changes in the existing application is where we compose the objects.
唯一修改的就是重组对象的部份代码。

Instead of passing the service reader directly to the view model, we pass the service reader to the caching data reader, and then we pass that to the view model.
我们 传递 service reader 到 caching reader 然后 将caching reader 传递给 view model。

This is a very powerful way to add functionality to existing code, and that is what the open/closed principle teaches us.
这是一种给现有代码增加功能很有用的办法，这正是开闭原则教我们做的事情。

The open/closed principle says that objects should be open to extension, but closed to modification.
开闭原则告诉我们，对象应该对扩展开放，对修改关闭。

There are a number of ways to accomplish this, and the decorator pattern is one of them.
有很多方式来实现开闭原则，装饰者模式只是其中的一种。

In our case, the existing data readers can be extended, such as with a client-side cache, but the data readers themselves do not need to be modified.
在我们的例子中，现有的 data reader 能够扩展，比如增加客户端缓存，但是 data reader 本身不需要修改。

When I first saw this pattern, I started thinking of different functions that could be added this way.
当我第一次接触这个模式，我就开始思考能够通过这种方式增加的功能。

I could add authorization code that ensures the user is allowed to read data before fetching it.
我可以增加 权限认证的代码，来确保用户有获取数据的权限。

I could add code that would retry a function a certain number of times if it failed.
我们能够增加重试的功能，失败一定次数内可以反复获取数据。

This is great when the network is unreliable.
当网络不可用的时候这很有用。

I could add code that logs exceptions that happen in the data reader.
我能够在 data reader 中产生异常的时候添加日志功能。

And since these are all data readers, the functionality can be stacked, decorators within decorators.
并且由于这些都是 data readers，因此功能能够不断的叠加，一个装饰者包含另一个装饰者。

And this works because the decorators are data readers.
这是因为 装饰者本身就是一种 data reader。

They expose the same functions to the application, so the application does not know the difference.
他们暴露相同的功能给应用的其他部份，所以应用程序不知道他们区别。

And this follows the Liskov substitution principle.
这也符合里氏替换原则。

This principle says that descendent classes should behave the same way that the base classes behave.
里氏替换原则 告诉我们 派生类 应当具备基类相同的行为。

Meaning that we can substitute a child class for a base class in our application, and the application does not know the difference.
意味着我们能够在应用中用一个子类来替代基类，并且应用不会感觉到有什么区别。

Obviously, we have extended behavior in the child class, but the calling code does not know the difference.
明显的，我们扩展了子类的行为，但是调用部份代码并没有收到影响。

In our case, the application does not know the difference between the caching reader and any of the real data readers.
略

That is because the caching reader implements the same interface, IPersonReader.
略

Making my boss and my users happy makes me happy.
略

That is why I write applications, to meet the users' needs.
略

And we saw how easy it is to meet those needs when we have loosely-coupled code.
我们看到使用解耦合代码使得需求很容易被满足。

We can change data readers very easily.
我们能够很容易地替换 data readers。

To get data from a text file, we create a CSV data reader that implements the IPersonReader interface and knows how to interact with files on the file system.
略

Then we compose our objects differently.
略

To get data from a SQL database, we create a SQL data reader that implements the IPersonReader interface and knows how to make SQL calls to the database.
略

Then, we compose our objects differently.
略

Using this formula, we can create any number of data readers.
略

Then we use the decorator pattern to add a client-side cache to the application.
我们使用装饰者模式来增加客户端缓存的功能。

Because the caching data reader wraps an existing data reader, it can add caching functionality to any data reader.
因为 caching data 包装了现有的 data reader，它能够 给任何 data reader 增加缓存功能。

We just compose our objects differently.
我们只是重组了对象而已。

And we saw how the code follows the SOLID principles.
我们也看到了代码符合 SOLID 原则。

In this case, we can extend the data readers without modifying them, adhering to the open/closed principle.
我们扩展了 data reader 并且没有对它们做修改，符合了开闭原则。

And we can swap out different data readers without our application knowing or caring, following the Liskov substitution principle.
我们能够包装不同的 data reader，并且保证应用的其他部份不收影响，符合了 里氏替换原则。

The third request from the boss is unit testing, and that is what we'll do next.
第三个需求是单元测试，我们将在下一章讲解。


### How Dependency Injection Makes Unit Testing Easier

#### Overview

Unit testing is huge in my world.
在我的世界中，单元测试大量存在。

For a long time, I did not use unit tests as part of my development process.
很长一段时间，我没有在开发过程中使用单元测试。

But once I started using them, I found that I can code more quickly and confidently.
但一旦我开始使用它们，我发现我能够开发的更快和更加有信心。

In addition, when bugs crop up, it is easier to pinpoint and fix them.
另外，当bugs跳出来的时候，也更加容易定位和解决。

Loosely-coupled code helps keep the unit tests easy to read and easy to write.
解耦合的代码使得单元测试更加便于阅读和编写。

We have already made our boss pretty happy.
我们已经让我们的老板挺高兴的了。

We can easily swap out different data sources, and we can add a client-side cache.
我们能够很容易的替换数据源，我们能够添加客户端缓存。

But now it is time to look at unit testing.
但是现在是时候看下单元测试了。

In this module, we will specifically look at how dependency injection makes unit testing easier.
本章中，我们将着重看下依赖注入是如何让单元测试变的简单的。

We will write tests for the presentation logic in our application.
我们将在应用中为表现层逻辑些测试代码。

After that, we'll look at another dependency injection pattern, property injection.
之后我们会介绍另一种依赖注入，属性注入。

In particular, we'll see how this pattern can help with unit testing.
特别的，我们将了解这种模式是怎么帮助单元测试的。


#### What We Want to Unit Test

Unit testing is testing pieces of functionality in isolation.
单元测试是用于测试独立的功能模块的。

There are other tests, such as integration tests, to see how the pieces all work together.
还有别的测试，比如集成测试，用于测试各个模块是如何一起工作的。

But here, we will focus on unit tests.
但这里，我们重点看单元测试。

And we will write tests for our presentation logic in the view model.
并且我们将为表现层的 view model 做测试。

The view model does not have much functionality, but we can verify some behavior.
view model 没有很多功能，但是我们能够验证一些行为。

And this will show the pattern we can use when we approach more complex code.
并且这能够演示我们在更加复杂代码中能够使用的模式。

First, we should test the RefreshPeople method.
首先，我们需要测试 RefreshPeople 方法。

When this method is called, we expect that the People property on the view model is populated.
当这个方法被调用时，我们期望 view model 的 People 属性被赋值了。

Similarly, we should test the ClearPeople method.
类似的，我们需要测试 ClearPeople 方法。

When this method is called, we expect that the People property on the view model is empty.
当这个方法被调用时，我们期望 view model 的 People 属性被清空了。

Back before we added dependency injection, we saw the problem with trying to test code that it tightly coupled.
回到我们添加依赖注入之前，我们了解了对紧耦合的代码做单元测试带来的问题。

In the tests, we create a view model.
在这个测试中，我们创建了一个 view model。

But with the tightly-coupled code, that also means that we get a service data reader and a connection to a production web service.
但是紧耦合的代码，意味着我们得到了一个 service data reader 并且连接着一个实际的web服务。

If the service is not running, then the test against the view model would fail.
如果服务没有运行，那么针对 view model 的测试就会失败。

The alternative is to use reflection to try to extract the service reader and replace it with a fake object, but that leads to overly complex test code.
另一种方法是使用反射来抽出 service reader 并且用一个假对象来替换，但这导致了过度复杂的测试代码。

But now that the code is loosely coupled, we do not need to rely on production data sources.
但是现在代码是接耦合的，我们不需要依赖于实际数据源。

In the tests, we can create a fake data reader with test data.
测试中，我们创建了一个假的 带测试数据的 data reader 。

Then we inject that fake reader into the view model through the constructor.
然后我们通过 view model 的构造函数注入了这个假的 reader。

This gives us full control over the test, the environment, and the data.
这给了我们测试，环境，数据的完全控制。

The code is well isolated.
代码很好的独立了。

The thing that makes me really happy is that the tests are only a few lines long.
让我真正高兴地是测试仅仅只有几行代码。

Tests that are easy to read and easy to write encourage developers to use them.
易于阅读和编写的测试能够鼓励程序员去使用它们。

So let's go to the code.
让我们来看下代码吧。


#### Demo: Adding a Fake Dependency for Testing

Before writing the unit tests themselves, we will create a fake data reader that will return some test data.
在些单元测试前，我们将创建一个假的 data reader 返回一些测试数据。

This gives us a consistent set of data that we can rely on in the tests.
这会给我们提供一些在测试中能够依赖的固定数据。

As a reminder, we want to create tests for our PeopleViewModel in the presentation layer.
作为提醒，我们将在表现层的 PeopleViewModel 创建测试。

And as we noted, we want to test the RefreshPeople method to make sure that the People property gets populated, and we want to test the ClearPeople method to make sure that the People property gets cleared out.
并且正如我们提到的，我们想要测试 RefreshPeople 方法来保证 People 属性 被赋值了，同时我们想要测试 ClearPeople 方法保证 People 属性被清空了。

So let's create a project for this.
所以让我们来创建一个工程。

First, I'll go ahead and add a new solution folder, and we'll call this UnitTests.
略

Then we'll add a new unit testing project.
我们添加一个单元测试项目 PeopleViewer.Presentation.Tests。

So we'll say Add, New Project.
略

And for this, I'm going to go to .NET Core, and bring in the MSTest Test Project.
略

And for the name, we'll choose PeopleViewer.Presentation.Tests.
略

And we'll go ahead and add a couple of dependencies that we need.
略

So I'm going to add a reference to the PeopleViewer.Presentation project, that contains the view model we want to test, as well as the PeopleViewer.Common project, which contains our Person class.


Now before writing the unit tests, I want to add a fake data reader.
在我们些单元测试之前，我们想要添加一个假的 data reader。

So I'm going to right-click on the test project and choose Add, Class, and we'll call this FakeReader.
因此我们新建一个 FakeReader 类。

And we'll make this a public class, and we need to implement the IPersonReader interface.
继承 IPersonReader 接口。

And again, I can use Ctrl+dot to bring in a using statement for our PeopleViewer.Common.
略

Now I need to implement the interface.
并且实现接口成员。

The easiest way to do that is just hit Ctrl+dot with the cursor on the interface, and choose Implement interface, which will stub out the methods for us.
略

Now I do have some test data that I want to work with, but I don't want you to have to type it in.
略

So if you go to the Solution folder, we'll just right-click and say Open Folder in File Explorer, and go to OtherClasses, there's a TestPeople.cs file.
略

I'm just going to open this with Visual Studio Code so we have it in another environment.
略

And this is just a small collection that contains some test data.
略

So I can copy that, and paste it into my FakeReader class.
略

And now that I have that, I can fill in the methods.
略

So for GetPeople, we can return our testData, and for GetPerson, we can do a link expression.
方法 GetPeople 返回一些测试数据。

So we'll return testData.FirstOrDefault, and you'll see that I need a using statement for this.
略

So we'll just go ahead and Ctrl+dot and bring in System.Linq, and then we'll say p goes to p.Id equals id.
略

So this will look inside the test data object and see if it can find a matching ID.
略

If so, it will return that value.
略

If not, it will return the default value for Person, which will be null in this case.
略

And this is all there is to creating a fake data reader class.
略

And now that we have it in place, we can go ahead and unit test the view model.
现在我们有了 假的 data reader， 可以开始对 view model 进行单元测试了。


#### Demo: Unit Testing with Constructor Injection

Now we can write unit tests for the view model.
现在我们能够为 view model 写单元测试了。

We will inject the fake data reader into the view model so that we will have consistent data and behavior.
我们将在 view model 中注入假的 data reader 以便获得一致的数据和行为。

Let's start writing some tests.
让我们开始写写测试。

So our test project currently has a UnitTest1.cs file.
我们的测试工程里添加一个 PeopleViewModelTests.cs 文件。

I'm going to rename this to PeopleViewModelTests.
略

And then when we rename the file, it will ask if we'd like to rename the class as well, and we'll say yes to that.
略

Now I want to flip to the Test Explorer to make sure that our unit test environment is set up correctly.
我们可以看下 Test Explorer 总单元测试环境是不是已经建好了。

And we see that we do have a TestMethod1 here, and we can run all the tests and see that, that currently passes.
我们能够看到有方法 TestMethod1，我们能够运行所有的测试，并且都通过了，即使他是空的。

One of the dangers of unit testing is that an empty test is a passing test, but that's a topic for another day.
略

In this case, I'm going to rename the test.


Since we're testing the People property, I'm going to start with People, and then I'll look at the state we're doing, so we'll say OnRefreshPeople.
我们将测试方法重命名为 OnRefreshPeople。

And then the third part will be the output that we're expecting.
接着就是我们期望的输出 IsPopulated。

So in this case, we'll say IsPopulated.
略

I like to keep my name so that I can tell what's going on.


In this case, we're looking at the People property and when it's refreshed, we expect that it will be populated.


I also like to use the Arrange, Act, Assert layout.
我喜欢用 Arrange, Act, Assert 布局。

This is a good way of organizing tests.
这时组织测试的好方式。

In the Arrange section, we have our setup code.


So in this case, we want to create a view model.


So we can say var viewModel = new PeopleViewModel.
我们建立一个 view model

Now our PeopleViewModel does want an IPersonReader as a parameter, and we can create an instance of our fake reader to fulfill that.
用 假的 reader 作为 view model 构造函数的参数。

So we'll say var reader = new FakeReader, and then we can pass that through to the constructor.


So this gives us a fully instantiated view model that's using our fake dependency.
因此我们有了一个 view model 使用了假的依赖。

Now in our Act section, we can run the RefreshPeople method, so viewModel.RefreshPeople.
然后在 Act 部分，我们运行 RefreshPeople 方法。

And then in our assertions, we want to check to make sure that the People property is populated.
接着在 assertions 中，我们希望检查 People 属性是否被赋值了。

So first, we'll say Assert.IsNotNull viewModel.People, and then we'll check that we have the expected number of records.


So we'll say Assert.AreEqual, 2, the number in our test data, and viewModel.People .Count.


Now count is not resolving because it's a LINQ method, so we hit Ctrl+dot, and we'll add using System.Linq to the top of the file.


And with this code in place, we can now run our unit test.
现在，我们能够运行我们的单元测试了。

And we see that we have a passing test.
我们看到我们的测试通过了。

Again, what we're testing is not very complex, but we can see a pattern here.
再次，我们测试的内容不复杂，但是我们能够看到

By using constructor injection, we have a place to put in our fake dependencies.
通过使用构造函数注入，我们有了一个放置我们的 假依赖的方式。

So we can pass in a fake data reader that has our test data in it, and we do not have to rely on any production code.


Let's write one more test to test the Clear method.
让我们再写一个方法来测试 Clear 方法 People_OnClearPeople_IsEmpty。

So for this, we'll use the attribute TestMethod to let MSTest know that this is in fact a test, and we'll say public void People_OnClearPeople_IsEmpty.


And we'll use the same Arrange, Act, Assert.


In our Arrange section, we'll do the same thing that we did above, so I'll just copy those two lines down to Arrange.


Now before we clear out the People property, I want to ensure that it's actually populated first.


If I just call clear and then check the People property, I don't know if it was properly cleared out or if it's just empty because it was empty when we created the view model.


So before calling clear, we'll go ahead and call refresh.


And after doing that, I can just do a little sanity check.


So we'll say Assert.AreNotEqual 0, viewModel.People .Count.


And what this will do is it will ensure that our arrangement is correct, that we have in fact a People property that is populated before we call clear.


And I'll go ahead and add a message of invalid arrangement to this so that if something does go wrong in this section, we'll know that it's not a real failure.


It's a setup failure.


In the Act section, we'll go ahead and call ClearPeople, viewModel.ClearPeople, and then in the Assert, we'll Assert.AreEqual 0, viewModel.People .Count.


So this test is a little bit longer because it has a more elaborate Arrange section.


But if we run the test, we'll see that this one passes as well.


I really like these tests because they are short and easy to understand.
我很喜欢这些测试，因为它们简短且很容易理解。

This encourages us to use them and write more tests when needed.
这鼓励我们去使用它们并且如果需要，编写更多的测试。


#### Property Injection
略

For the next set of unit tests, we will test the CSV data reader that gets data from a text file.


Specifically, we want to see how the CSV data reader behaves if there are bad records in the file or no records at all.


But there is a bit of a problem when unit testing this class.


In the constructor, we new up an instance of a CSVFileLoader.


This object reads data from the file system.


Here is the FileLoader class.


It uses a StreamReader to read a file off of the file system.


We really do not want this for our unit tests.


Unit tests should be isolated from these types of dependencies.


The good news is that we have already implemented a solution for this.


Back in the constructor for the CSV data reader, notice that the CSV file loader is assigned to a public property.


The public property provides an injection point so that we can put in a fake file loader that we can use for testing.


You might be wondering why we do not use constructor injection here.


We will take a look at that in a bit.


But first, let's go to the code to see property injection in action.



#### Demo: Unit Testing with Property Injection
略
In this demo, we will create tests for the CSV data reader.


To do this, we'll create a fake file loader so that we do not need to use the real file system.


Then we will inject the fake file loader into the CSV data reader.


Let's flip over to the code.


Let's just take a quick look at our CSV reader.


This is in the PersonDataReader.CSV project, and we can see our code here.


Again, the constructor news up a CSVFileLoader that does actually access the file system.


But because we have a public property for that, we can replace it with our test object.


What we want to test is the behavior of the GetPeople method.


If there are bad records or no records in the file, how does this method behave? We'll run a variety of data through the method and see what comes out.


So let's create a new test project for this.


Underneath UnitTests, we'll just right-click, and say Add, New Project, and we'll pick the .NET Core MSTest Test Project.


And we'll name this PersonDataReader.CSV .Tests.


The first thing I'll do is bring in some data that we can use for testing.


For this, I'm just going to add a new class, and call it TestData.


But instead of filling it in myself, I'll go to some code I already have prepared.


If we go to the Solution folder on the file system, and then go to the OtherClasses folder, there's a TestData file here for us.


I'm going to open this with Visual Studio Code so that we can take a look at it in a different environment.


So I'm just going to use select all, and copy this to my clipboard, and go back to Visual Studio, and select all and paste.


And what I have here are a variety of strings.


So I have a string called WithGoodRecords, which has two valid records; I have WithGoodAndBadRecords, which has two valid records and two invalid records; and then I have WithOnlyBadRecords, which has two invalid records.


These are records that are not in the proper comma-separated values format, so they're not able to be parsed into Person objects.


To supply this data, I want a fake file loader.


So let's go ahead and add a new class, and call this FakeFileLoader, and then I'll bring in some code from the file system.


In the OtherClasses folder, I also have a FakeFileLoader.cs file, and let's just copy and paste this code into Visual Studio.


Now you'll notice that the ICSVFileLoader is not resolving, and that's because I haven't added in an assembly reference to the CSV file loader.


So let's go ahead and add a reference, pick PersonDataReader.CSV, and then now we can see that everything's happy.


So let's take a look at this class.


First, it does implement the ICSVFileLoader interface.


That's the interface that we need for the property.


That has just one method, the LoadFile method, that returns a string.


Now to make this class more useful, the constructor has a dataType parameter that can be passed in.


Based on the parameter, LoadFile will return either the good data, the mixed data, the bad data, or even an empty string.


If we do not supply any value, then by default, it will return the good records.


So now that we have our fake file loader in place, let's go ahead and create some tests.


Just like we did with our other project, we'll change the UnitTest1.cs file to CSVReaderTests, and we'll rename both the file and the class.


And now let's open up our Test Explorer to make sure that everything's in place.


And we can see that we do have a CSVReaderTests, and our TestMethod1 is there.


So let's start with our first test, and this will be testing for good records.


So we'll say GetPeople_WithGoodRecords_ReturnsAllRecords.


And we'll create our data reader, so we'll say var reader = new CSVReader.


And since the constructor does not have any parameters, this is all we need to do.


But we do want to replace the real file loader.


So we can say reader.FileLoader = new FakeFileLoader, and we'll go ahead and pass in the string of Good so that we get good records back.


So this is the arrangement for our test.


For the act, we'll say var result = reader.GetPeople.


And then for our assertion, we'll make sure that there's 2 people in that output, so we'll say Assert.AreEqual 2, result.Count.


And again, we'll need to bring in System.Linq to get that Count method.


Now when we run our tests, we'll see that this test passes, and it uses our in-memory fake file loader rather than using anything that's on the file system.


Now just to prove that, let's go ahead and comment out where we set that property, and try running the tests again.


What we'll see is that our test does fail.


And if we look at the error message that we get, we'll see that it's actually looking for a People.txt file on the file system.


Since we do not have that in our test environment, we get an exception.


So we can see that, by default, the CSV reader tries to use a real CSV file loader that reads from the file system.


But we do have the option to override the property with our own behavior, and that way, we're not dependent on the file system when we want to do things like unit testing.


Now we just saw that if it tries to access the file system and the file's not there, it throws an exception.


Let's go ahead and verify that behavior as well.


So we'll do a TestMethod, and we'll say public void GetPeople_WithNoFile_ThrowsFileNotFoundException.


And for this, we can just new up our reader, but we will not set the property so it will try to access the real file system.


And in MSTest, we have an assertion to make sure that it throws an expected exception.


So we can say Assert.ThrowsException, and we'll say FileNotFoundException.


And I'll need to do a Ctrl+dot to bring in the using statement for System.IO, and this needs an action.


So we'll just do empty parenthesis, which will mean no parameter, and we'll say reader.GetPeople just like that.


So what this will do is it will run the reader.GetPeople method and check to see if it throws a FileNotFoundException.


If it does throw that exception, then this test will pass.


If it does not throw the exception, then the test will fail.


And if we run our tests at this point, we'll see that both of these tests pass.


Now there are some other scenarios that I would like to test and kind of the easiest way to do this would be to do a copy and paste on our first test method.


So we'll copy and paste this method, and then give it a new name.


So in this case, we'll say GetPeople_WithSomeBadRecords_ReturnsGoodRecords.


I really like the names of my test to be descriptive so if they fail in the Test Explorer, I can get a good idea of what's going on without having to dig into the tests.


In this case, we'll change the parameter on the FakeFileLoader to Mixed so it will return us some good records and some bad records.


For the assertion, we'll still check to make sure that there's two records in there because there are two good records mixed in with the bad records.


And if we run the test, we'll see that this passes as well.


Let's do another test just for bad records.


So in this case, we'll do a test that says GetPeople_WithOnlyBadRecords, and in this case the result will be that it returns an empty list.


And we'll just have to change the parameter on our file loader to say give us the bad records.


And then for our assertion, we'll set this to 0 rather than 2.


And we can run our test to make sure that this one passes as well.


Now there is one last test.


I want to see how our class behaves if there's an empty file.


So in this case, we'll say GetPeople_WithEmptyFile_ReturnsEmptyList.


So if there's an empty file, I want an empty list back as opposed to throwing an exception.


Now on this, we can just change our FakeFileLoader parameter so that this will say Empty, and then our assertion will be the same.


We'll expect that there are 0 items in the result.


But if for some reason this particular test were to throw an exception, then the test would fail, and we could change the behavior.


So now let's run the tests, and we'll see that now we have five passing unit tests that are going against our CSV reader.


Property injection works really well for this scenario.


By using property injection, we have a good default behavior when the application runs, but we also have an injection point where we can swap in a fake object for our unit tests.


And similar to when we use constructor injection, this allows us to write unit tests that are very easy to read and very easy to write.



#### Summary

Let's do a review of property injection.
让我们回顾下 属性注入。

When using property injection, we have a property on the class that is initialized for standard behavior.
当我们使用属性注入，我们有一个类的属性，已经初始化来满足标准的行为。

If we do nothing, then by default, the standard behavior is used, and this is what we want most of the time.
如果我们什么也不做，就使用标准的行为，这也是大多数时候我们需要的。

But the property can also be set to provide alternate behavior such as for our unit tests.
但是这个属性也可以设置来提供不同的行为例如用来我们的单元测试。

In our CSV data reader class, the default is to use the real file loader.
在 CSV data reader 中，默认我们使用真正的文件加载。

We do not have to do anything special to get this behavior.
我们不需要额外的操作获得这种行为。

If we new up the class and start using it, we get the real file loader.
如果我们实例化类，并使用它，我们得到的是真正的文件加载。

But the FileLoader property acts as an injection point.
但是 FIleLoader 属性扮演着一个注入点。

We have the option of overriding the default behavior.
我们有方式可以重写默认的行为。

In our unit tests, this lets us easily separate the code we want to test in the CSV data reader from the file loading process.
在我们的单元测试中，这让我们很简单的分割了 CSV data reader 和 文件加载过程。

We can easily provide test data to exercise the code in the tests.
我们能够很简单的提供测试代码的数据。

So why not use constructor injection here? It worked well in the previous examples.
那么为什么我们要使用构造函数注入呢？ 它在之前的例子中公祖哦的不错。

Constructor injection forces us to provide a value for the dependency.
构造函数注入强制我们为依赖提供一个值。

If we do not supply the parameter, then the class will not work.


For the CSV data reader, we do not want to force the users of this class to pick a file loader.
对于 csv data reader， 我们不想要强制类的用户选择一个文锦啊加载器。

That's because 99% of the time, we want to use the CSV file loader, the object that gets data from the file system.
因为 99% 的时候，我们想要一个 CSV 文件加载器，一个从文件系统获得数据的对象。

So if we do nothing, we get the production behavior that we want by default.
因此，如果我们什么也不做，我们默认获得了我们想要的实际行为。

But if we want to change that behavior, we have the option to.
但如果我们想要改变这个行为，我们也有方式去做。

The short version is that constructor injection is good for when we want to force a decision on a dependency.


Property injection is good for when we have a default dependency that we want to use most of the time.


In this module, we looked at how dependency injection and loosely-coupled code makes unit testing easier.


We tested the presentation logic in the view model and found that we could write unit tests that were just a handful of lines long.


With constructor injection, we have a place to put our fake object with the data that we need for testing.


We also tested the CSV data reader.


When we use the CSV data reader in production, we want to use a real file loader that reads data from the file system.


When we use property injection, we do not need to do anything special for this behavior, but we still have a place to swap out the real file loader for a fake one by setting a property.


This gives us a way to easily inject data that we need for testing.


So far, we have used dependency injection without a dependency injection container.
截止目前，我们没有使用依赖注入容器。

This is so that we can get a good handle on the concepts and understand loose coupling.
从而我们能够更好的理解概念和解耦合。

But containers are important.
但是容器是重要的。

Next up, we will look at several containers to see what they do and how they fit into the current application.
下一章。我们将看下几种容器，了解它们能做什么，以及怎么加到我们的应用程序中去。


### Dependency Injection Containers

#### Overview

So far, we have learned quite a bit about dependency injection including why we want loosely-coupled code and how constructor injection and property injection can help us with that.
目前，我们学习了不少依赖注入的知识，包括我们需要解耦合的代码，以及如何通过构造函数注入和属性注入实现。

Now that we have that basis, it is time to look at dependency injection containers.
现在我们有了这些基础，是时候看下依赖注入容器了。

There are a number of popular full-featured dependency injection containers in the .NET world.
在.NET的世界中，有很多流行的功能齐全的依赖注入容器。

We will look at two of those containers today, Autofac and Ninject.
我们将挑选其中的两个进行讲解，AutoFac 和 NinJect。

In addition, many of our framework have dependency injection containers built in.
另外，许多框架都包含了依赖注入容器。

We will take a look at the one included with ASP.NET Core MVC.
我们将会看下ASP.NET Core MVC 当中包含的依赖注入容器。

This is not meant to teach you how to use a particular container.
这不是为了教你如何使用一个特定的容器。

These containers have a lot of features.
这些容器包含了许多特性。

We will see how to use them with the sample application, and this will give us an idea of what it is like to use a dependency injection container.
我们将结合示例应用看下，这会让我们了解使用依赖注入容器的大概情况。

We will get an overview of dependency injection containers by looking at several of them in action.
通过在演示中看些容器的使用，我们将会获得一个依赖注入容器的该要，

We will start with a look at why we want to use a dependency injection container.
我们将首先看下为什么我们要容依赖注入容器。

Then we will use Ninject in the current application.
然后我们会在当前项目中使用 Ninject。

We will see how to configure the container, manage object lifetime, and get objects out of the container.
我们将会看下如何配置容器，管理对象生命周期，以及从获得中获得对象。

Then we will do the same with Autofac.
然后我们会 结合 Autofac 再做一遍。

In addition, we will look at how to do late binding with Autofac.
此外，我们将会看到如何通过 Autofac 达到延迟绑定。

This is where we make decisions of what objects we want to use at runtime, and this gives us the flexibility that we need for our application scenario.
通过延迟绑定，我们可以在运行时决定我们需要的对象，这给了我们应用场景需要的灵活性。

Finally, we will look at the ASP.NET Core MVC dependency injection container.
最后，我们会看下 ASP.NET Core MVC 的依赖注入容器。

This is not designed as a standalone container, but it works very well in the ASP.NET MVC pipeline and makes it very easy to inject dependencies into MVC controllers.
这不是一个独立的容器，但是在 ASP.NET MVC 管道中工作的很好，并且很容易的将依赖注入了 MVC 控制器中。

We will spend most of our time in code.
我们会用大量时间在代码中进行讲解。

But first, let's take a look at why we want to use the dependency injection container.
但首先，我们先看下为什么我们想要使用依赖注入容器。


#### Dependency Injection Container Features

In the sample application, we have done everything manually.
在示例应用中，我们手动地完成了每件事。

We create and compose the objects when the application starts.
我们在应用程序启动的时候，创建并组合对象。

This works fine for this application since we have a minimal number of objects.
对这个应用没什么问题，因为我们拥有最少数量的对象。

But as things get more complex, we can really appreciate the functionality provided by a dependency injection container.
但是随着事情变得复杂，我们会很感激依赖注入容器带来的便利的。

One container feature is auto-registration.
一个容器的特性就是自动注册。

The container will search for objects that can be used as dependencies and catalog them.
容器会为对象搜索依赖并归类。

This keeps our configuration code to a minimum.
这使得我们的配置代码降到最少。

This gives us a lot of flexibility, but it is less efficient, so it could lengthen the time it takes to start the application.
这给了我们很大的灵活性，但是这降低了效率，因此这使得启动应用的时间变长了。

Another feature is auto-wiring.
另一个特性是自动串联。

The container will figure out how to create the objects by resolving dependencies based on what has been registered.
容器将分析出，如何通过依赖关系来创建对象。

This really saves on the amount of configuration code required.
这的的确确减少了配置代码量。

Another feature is lifetime management.
另一个特性是生命周期管理。

When we looked at tight coupling, we noted that if an object news up a dependency, it is responsible for the lifetime of that object.
当我们在看紧耦合的代码时，我们发现如果一个对象实例化一个依赖，那么它就得负责这个对象的生命周期。

With a dependency injection container, the container is responsible for the lifetime.
有了依赖注入容器，容器会负责生命周期。

And we can tell the container how to manage lifetimes such as by always reusing the same instance of a dependency or always creating a new instance of a dependency.
我们能够告诉容器如何管理生命周期，比如使用相同的依赖实例还是总是创建一个新的依赖实例。

These are features that we will touch on in the sample code.
这些是我们要在示例中讲解的特性。

To get a full picture of the capabilities, be sure to check the documentation for the container that you're using.
想要获得完整的功能说明，记得检查使用的容器的官方文档。


#### Demo: Using Ninject

For this demo, we'll look at using Ninject as a dependency injection container.
在这个例子中，我们将使用 Ninject 作为依赖注入容器。

As part of that, we will see how to configure the container, how to manage lifetimes of our dependencies, and how to compose the objects that we need for our application.
我们会看下如何配置容器，如何管理依赖的生命周期，如何组合应用程序的对象。

So let's head over to the code.
所以，让我们来看下代码。

==========> 以下略
Here in Visual Studio, we have several other projects under the Bootstrapper folder.


We'll start with PeopleViewer.Ninject.


At this point, the project is basically a copy of the PeopleViewer project that we've been using with the configuration removed.


We're going to add the dependency injection container and see some of its features.


To start with, I'll go ahead and set this as the startup project.


So we'll right-click on it, and say Set as StartUp Project, and I'll also start the People.Service, our web service.


So again, I'll go to Power Commands, Open Command Prompt, and then type dotnet run.


So let's take a look at what we have in the App.xaml .cs where we composed the objects in our other application.


Right now, we have a fairly empty file.


This application has all of the configuration removed.


You'll notice that ComposeObjects is empty at this point, and we have a new method, ConfigureContainer.


This is where we'll put the configuration information for Ninject.


But before we do that, let's go ahead and add the NuGet package.


So we'll just right-click on References, say Manage NuGet Packages, and then search for Ninject.


We just need the core package, so we'll go ahead and add that to our project.


So now let's add our code.


The first thing we'll do is add a field for the container at the top of our class.


Ninject uses an interface named IKernel.


So we can type in IKernel, hit Ctrl+dot to bring in the using statement, and we'll call this Container, and we'll new it up to a StandardKernel.


A new standard kernel is a way we can new up an instance of a Ninject container.


Now that we have the container, let's go ahead and configure and use it.


In the ConfigureContainer section, we need to tell Ninject how to match up an abstract object with a concrete type.


In our case, we want to take our interface, IPersonReader, and connect it with one of our concrete data readers.


One thing I like about Ninject, it has a very fluent syntax.


So to do this, we can say Container.Bind IPersonReader, and again, we'll do Ctrl+dot to bring in a using statement, .To ServiceReader.


And again, we'll do Ctrl+dot to bring in the using statement for PersonDataReader.Service.


So this tells the container that if somebody asks for an IPersonReader, it should supply an instance of the ServiceReader.


Down in our ComposeObjects, we'll set the application, main window.


So we'll say Application.Current .MainWindow, and instead of newing this up ourselves, we'll ask the container for it.


So we'll say Container.Get PeopleViewerWindow.


And this is all the code that we need to write.


And that's part of our problem because this looks like a lot less code than when we were dealing with this manually.


I don't see a reference to the view model at all here, and that's actually part of the magic of containers.


Let's go ahead and run our application to see if it works.


And when we click on the button, we see that we do actually get data from the service.


Well let's make sure that we're running the right application.


Let's go ahead and change the binding from the ServiceReader to the CSVReader.


And again, we'll do Ctrl+dot to bring in the using statement for that.


Now when we run the application, we're getting data from the text file.


And again, we can tell because this has an extra record, Jeremy Awesome.


So what's happening here is Ninject is auto-wiring up our objects with all of our dependencies for us.


So when we ask Ninject to get us a PeopleViewerWindow, Ninject says, do I know what that is? And the answer is yes.


There's an assembly reference to that.


So Ninject looks at the constructors and finds that the PeopleViewerWindow needs a PeopleViewModel as a parameter.


So Ninject says, do I know what that is? And the answer is yes.


There's an assembly reference to that.


And so then Ninject looks at its constructors.


The PeopleViewModel needs an IPersonReader as a parameter.


So Ninject says, do I know what that is? And the answer is yes.


If we go back to our configuration, we have a binding that says if someone asks for an IPersonReader, Ninject needs to supply a CSVReader.


So then Ninject says, do I know what that is? And the answer is yes because there's an assembly reference to the CSVReader.


So then Ninject looks at its constructors, and in this case, it finds a default, no-parameter, constructor.


So Ninject creates an instance of the CSVReader, and then uses it to create all of the objects needed for the object graph.


And once it's done that, we will have an instance of the PeopleViewerWindow.


So we can see why this code would be confusing if you walk up to it without a good understanding of what's actually going on with the dependency injection.


In this case, it looks like there's pieces missing, but in actuality, the container configured those things out.


Now one other thing that's really useful with dependency injection containers is managing the lifetime.


With the CSVReader, we can continue by saying .InScope, and notice that we have a number of options here.


We have InScope, InSingletonScope, InThreadScope, and InTransientScope.


If we choose InSingletonScope, then what that means is that Ninject will keep a reference to one instance of the CSVReader.


So if at a future time we ask for another IPersonReader, Ninject will supply us with the same instance.


If we were to say InTransientScope, then Ninject will provide us with a new, fresh instance every time we ask for one.


InThreadScope will manage it so that we have one instance per thread, and that's actually something you probably don't want to manage yourself.


So this gives us a way to tell the container how we would like to manage the lifetime of our objects.


And in general, if we do not specify a particular scope, most containers will default to a transient scope where the object is re-created each time we request it.


But you'll want to be sure to check the documentation of a particular container for that.



#### Demo: Using a Decorator with Ninject

Usually what happens after I show someone how to use Ninject, the question comes up, how do we use a decorator with Ninject? So let's take a quick look at that.


Here we are back in our configuration.


And in this case, instead of using a CSVReader, we'll using CachingReader.


And again, we'll use Ctrl+dot to bring in the using statement for that.


But we do have a problem because the CachingReader requires an IPersonReader as a parameter.


If we try to run the code right now, we'll find that we have a circular reference, and we'll get an exception.


But there is a way that we can take a little bit more control of this.


So after the .InSingletonScope, we can say .WithConstructorArgument, and tell Ninject that the CachingReader has an IPersonReader as a parameter.


Now all we have to do is supply a value for that.


Now we could new up a ServiceReader directly, and this code will actually work.


But if I do things this way, I'm taking control away from the container.


So instead of newing up the ServiceReader directly, a better thing to do is ask the container for it.


So we can say Container.Get ServiceReader.


So now we're asking the container to supply us with the service reader that it will then use as a constructor parameter for the CachingReader.


And when we run the application, we'll see that it all works together.


If we click on our Fetch People button, we'll see that we are using the PersonDataReader.Decorators .CachingReader, and the data's actually coming from the service.


The full-feature dependency injection containers are very powerful.


So if there's a piece of configuration that you need, there's probably a way of doing it.


One of the best things you can do is dig through the documentation for the container that you choose.



#### Demo: Using Autofac

So we've seen Ninject.


Let's do the same thing with Autofac.


We'll go through the same steps of configuring the container, looking at lifetime management, and composing the objects in the application.


We already have a bootstrapper application stubbed out for this, so let's go ahead and set PeopleViewer.Autofac as the startup project, and take a look at the App.xaml .cs file.


So this is in the same state as we were looking at with Ninject.


So we have an empty ConfigureContainer and an empty ComposeObjects.


So let's go through the steps of using Autofac.


The first thing we'll do is add the NuGet package.


So we'll right-click, and say Manage NuGet Packages, and then we'll add Autofac.


And in this case, we'll add the main package.


With that in place, we can go back to our code and start using it.


So just like we did with Ninject, I'm going to create a class-level field, and this is an IContainer.


IContainer is the interface that Autofac uses.


Now you do need to be careful when you do Ctrl+dot to bring in the using statement.


You'll see there's an option for using System.ComponentModel or using Autofac.


Make sure that you use Autofac if you're trying to get to the dependency injection container.


So we'll call our field, Container.


Autofac configuration is a little more involved than Ninject, and that's because there's so many different options that we have available.


First, we need to create a container builder.


So we'll say var builder = new ContainerBuilder, and then we need to create our mappings between our interface and our concrete type.


So we say builder.RegisterType, and then we use our concrete type, ServiceReader.


And again, we'll do Ctrl+dot to bring in the using statement for that.


And then we say .As IPersonReader.


And again, we'll do Ctrl+dot to bring in the using statement for that.


So this creates the mapping between our concrete type, the ServiceReader, and our interface, IPersonReader.


And just like with Ninject, we can specify a lifetime.


So we can say .SingleInstance, and that will give us a singleton like we saw with Ninject.


So each time we ask for an IPersonReader, we'll be given the same instance of the ServiceReader.


Autofac also supports auto-registration.


So we can say builder.RegisterSource, and then we say new AnyConcreteTypeNotAlreadyRegisteredSource.


That's a bit of a mouthful, and you'll see it's not resolved in the standard Autofac namespace, so we do need to bring in using Autofac.Features .ResolveAnything.


So what this will do is register any concrete types that it has access to inside the assemblies.


If you look at the Autofac documentation, this is not the recommended way to use Autofac, but it does have this similar feature to what we saw with Ninject.


In our next demo, we'll look at another way of registering our objects.


For now, let's go ahead and complete the container by setting our Container equal to builder.Build.


And that will give us a container that's ready to use.


So then in our ComposeObjects, we just have to do Application.Current .MainWindow and again, we'll ask the container for this.


So we'll say Container.Resolve PeopleViewerWindow.


And just like with Ninject, it will figure out all of the details.


Let's go ahead and run our application to see if it works.


So we can click on the Fetch People button, and we get data from the service.


And we can come back and change our mapping.


So instead of registering the type, ServiceReader, we'll do CSVReader.


And now when we run our application, we get data from the text file.


Now like I mentioned, the automatic registration is not recommended with Autofac, and that's because this code uses reflection, and that's generally slow in the .NET world.


Now how fast or slow it is will depend on how large your application is and what kind of objects you have in it.


But if we want to take more control over this, we certainly can, and that's what we'll do in the next demo.



#### Demo: Manual Registration with Autofac

So we've seen the basics of using Autofac.


Now we'll take a closer look at registration.


Specifically, we'll see the differences between auto-registration and manual registration.


The code that we looked at earlier is doing auto-registration.


When we have the AnyConcreteTypeNotAlreadyRegisteredSource, that will pull everything out of the assemblies if we need them.


According to the documentation, this is here for people who are used to using other dependency injection containers, such as Ninject, that do this by default.


But it's actually recommended that registration be more explicit, so let's go ahead and do that.


Instead of doing this, we'll register just the types that we need.


So we'll say builder.RegisterType and we'll register the PeopleViewerWindow, and we'll mark this as InstancePerDependency.


This is a lifetime notation, and InstancePerDependency is the same as transient in Ninject.


So each time we ask for PeopleViewerWindow, we'll get a new instance.


We also need to register the view model.


So we'll say builder.RegisterType PeopleViewModel, and we'll have to bring in the using statement for that, and then again, we'll say InstancePerDependency on this one as well.


So this code is a bit more explicit.


We're telling Autofac that we want to use the PeopleViewerWindow and the PeopleViewModel.


If we try to resolve any objects outside of this, then it will throw an error.


And if we run the application, we'll see that it still works.


Right now, when we click the button, we'll get data from our CSV text file.


But we can go in and change that to the ServiceReader.


And now when we run the application, we'll get data from the service.


Autofac has multiple ways of registering objects.


You'll definitely want to look at the documentation.


The different options are good for different types of objects that you're resolving.


And the documentation will tell you which ways are most efficient for your needs.



#### Demo: Using a Decorator with Autofac

The next thing we'll do with Autofac is configure it to use our caching decorator.


And here we are still in the PeopleViewer.Autofac project, and we're going to change this to use our caching decorator.


For this, what we're going to do is register our ServiceReader a little bit differently.


So instead of having our RegisterType As, we're going to give it a name.


So we'll say .Named, and then as a parameter, we'll give it a name, which will be reader.


And we'll go ahead and keep the SingleInstance notation on that.


The builder has a way to register decorators.


So we'll say builder.RegisterDecorator, and this is an IPersonReader, so that's the type that we're decorating, and then we need to give it a lambda expression.


In this case, we'll use c, which represents the container, and inner, which is the inner type.


And inside here, we'll create a new CachingReader, and again, Ctrl+dot to bring in the using statement, and pass it inner as the type.


And then to figure out what that type is, we'll say fromKey, and then pass in reader, which is the Named type that we gave to the ServiceReader above.


And with this code in place, we'll be able to use the caching decorator.


When we run the application and click the button, we'll see that we are using the caching reader, and our data is coming from the service reader.


We can change the configuration to use the CSVReader as the inner object.


And then we'll see, even though we're using the caching reader on the outside, we're now using the CSV reader on the inside.


Autofac is extremely flexible.


The good news is that the Autofac documentation is very thorough, and if there's a piece of configuration you need, it probably exists in there somewhere.



#### Demo: Late Binding with Autofac

We have one more demo to look at for Autofac, and this is how to do late binding.
我们再来看一个 Autofac 的示例，如何使用延迟绑定。

Late binding is when we make runtime choices rather than compile-time choices.
延迟绑定是我们在运行时做决定，而不是在编译时。

For our scenario where we have different clients, this makes a lot of sense.
在我们多客户端的场景中，这很有用。

If we use late binding, then we can give each of our clients just the pieces of code that they need without needing to rebuild the application for each client.
如果我们使用延迟绑定，我们能够给我们不同的客户端需要的部分代码并且不需要重新编译每个客户端。

We have another project, PeopleViewer.Autofac.LateBinding.
我们有另一个工程 PeopleViewer.Autofac.LateBinding。

Let's go ahead and set this as the startup project.


Now in this case, the functionality has already been added.


So rather than adding each bit of code manually, we'll just walk through what's there.


This will give you a good idea of what's available so that you can explore further.


The first thing to note about the late binding project is it does not have any compile-time references to our data readers.
首先，我们注意到，延迟绑定代码没有任何关于 data reader 的编译时引用。

So if we look in our References, we do not see any references to PersonDataReader.Service, PersonDataReader.CSV, or PersonDataReader.SQL.
所以我们看下我们的引用列表，我们不会看到 PersonDataReader.Service, PersonDataReader.CSV 或者 PersonDataReader.SQL.

Instead, if we need these, we'll pick them up at runtime.
而是，如果需要的话，在运行时选择。

So if we don't have any compile-time references, how is this code even going to work? Well, we're going to take the assemblies that we need and put them into the output folder with the executable.


And for that, we have a post-build step on our project.


So if we go to the project properties, one of the things we do is copy all of the files from the LateBindingAssemblies folder.


Let's take a quick look at what's in there.


If we go to our Solution folder and then look at the LateBindingAssemblies folder, we see that we have references for Microsoft.EntityFrameworkCore, as well as Newtonsoft.Json, as well as our PersonDataReader.CSV, PersonDataReader.Service, PersonDataReader.SQL, as well as PersonDataReader.Decorators.


So in this case, we're providing all of the DLLs for the data readers that we've created.


So let's see how Autofac gets these.


In order to use the late binding features of Autofac, we have a few more NuGet packages, and these have already been added to this project.


So we see, in addition to the Autofac core project, we also have Autofac.Configuration, Microsoft.Extensions.Configuration, and Microsoft.Extensions.Configuration.Json.


Fortunately, you don't need to remember all of these packages.


The Autofac documentation on late binding will tell you exactly what you need.


So let's see what the configuration looks like.


For this, we'll look at the App.xaml.cs file, and scroll down to the ConfigureContainer.


First, we create a new ConfigurationBuilder, and from there, we add a JSON file to that, autofac.json.


We'll look at the contents of that file in just a bit.


Then, we use a ConfigurationModule and build that configuration builder.


After that, we create our ContainerBuilder, and we register our configuration module with the builder.


This will take care of everything that's contained in the autofac.json file.


Rather than registering the other items separately, I opted to use the auto-registration here just to keep things simple from a code standpoint.


So let's look at the autofac.json file, and this is something that's included in our project.


So this registers a new type, PersonDataReader.Service .ServiceReader.


And this also tells us that we find this in the PersonDataReader.Service assembly.


Now what do we attach this to? Well, we want to attach this to the interface.


So we have a reference to the type, PeopleViewer.Common .IPersonReader, and this type is in the PeopleViewer.Common assembly.


So if we run the application, we see that it will use the service reader, and we can see it is actually getting data from the service.


But for the real power of this, let's go look at this from the file system.


I'm going to navigate to the output folder for this project.


So we'll say Open Folder in File Explorer, and we'll go to bin and Debug.


And if we scroll down, we will find the PeopleViewer.Autofac .LateBinding .exe.


And we can double-click on this to run the application and again, it will get data from the service.


But watch this.


Let's edit the autofac.json file.


And I'll just right-click on this and open it with Visual Studio Code.


Now I'm going to change this.


So instead of Service, we'll say CSV.CSVReader, and we'll say that this comes from the PersonDataReader.CSV assembly.


So what I'm doing is I'm changing the configuration for how Autofac will work.


Now I just save that file and go back to the file system.


Now if we double-click on the PeopleViewer.Autofac .LateBinding executable and click on Fetch People, we're getting data from the CSV reader.


The first time I saw late binding, I thought of all the various possibilities that I could use it for.


For the scenario that we described with multiple clients, it would work great.


In this case, we could give each client the core executable along with the DLLs that they need for their particular data reader.


Then, by using configuration, we can have them load up the data reader that they need.


If we have a new client come on board that needs a different data reader, there's no need to rebuild the entire application.


Now this is also a bit dangerous, and that's because this autofac.json file is not compiled.


It's very easy to make typographical errors and in that case, we end up with runtime errors.


So we can see that there's quite a bit of flexibility with Autofac.


Again, for the specifics, be sure to check out the documentation, as well as the Pluralsight courses that take a deeper dive into it.



#### Demo: ASP.NET Core MVC Dependency Injection

The last container that we'll look at is the one that's included with ASP.NET Core MVC.


Specifically, we'll look at how we can do constructor injection on a controller, and then compose the objects at startup.


So let's flip over to the code to take a look at that.


This dependency injection is already in place.


In fact, we've been using it this whole time in the People.Service project.


So let's go to the Controllers and look at the PeopleController, the one that supplies us with our data.


The PeopleController has an IPeopleProvider field, and that IPeopleProvider is injected through the constructor.


The Get method on the controller calls the GetPeople method on the provider.


So on IPeopleProvider, let's go ahead and go to definition.


This shows us the interface, which is a single method, GetPeople, that returns a list of person.


And if we right-click on this and go to implementation, we'll see a StaticPeopleProvider.


This is the one that's actually used by the web service, and this just provides a hardcoded list of values that are returned.


Now this StaticPeopleProvider does need to be injected into the controller, and that's taken care of at startup for this application.


So let's open this up and go to the Startup class.


The Startup class has a ConfigureServices method, and this is where we can configure our dependency injection.


Notice the second line on this, services.AddSingleton IPeopleProvider StaticPeopleProvider.


This is setting up a mapping between our abstraction, the IPeopleProvider, and a concrete type, the StaticPeopleProvider.


The concept of lifetime is built in to this statement.


Unlike the other containers, we're forced to pick a lifetime, singleton, scoped, or transient.


There is no default in this case.


This container is not a full-featured container.


If we need more features, we can configure ASP.NET Core MVC to use a different container such as Autofac.


The docs.microsoft .com site has an article to show exactly how to do that.


Some people have dismissed the built-in dependency injection container because it is not a standalone container and cannot be used in other applications.


Well, technically it can, but it doesn't do a very good job.


But we should look at the built-in container for what it is, a really easy way to get basic dependency injection in our ASP.NET Core MVC applications.


Many times, we just need to inject some constructor parameters.


The built-in container lets us do that very easily.



#### Dependency Injection Container Summary

Dependency injection containers provide us with a number of features.
依赖注入容器提供了不少特性。

We saw how Autofac allows us to do auto-registration by looking through the assemblies in the solution, but we also saw how we can manually register our objects.
我们看到 Autofac 通过遍历解决方案中的程序集来为我们自动注册，但我们也看到来我们是如何手动注册对象的。

The path we take depends on our needs whether we need to focus on flexibility or on speed.
是想要灵活性还是执行效率，如何选择，取决于我们的需要。

We saw how containers auto-wire the objects.
我们看到了 依赖注入容器是如何自动串联对象的。

When we ask the container for PeopleViewerWindow, it decides how to create that object based on the constructors and dependencies.
当我们想要 PeopleViewerWindow 时，它通过构造函数以及依赖决定如何创建对象。

And we saw that containers offer lifetime management.
我们看到容器提供了生命周期管理。

We did not go into detail here because the sample application does not really change much based on lifetime.


When we have larger applications, we decide which objects we want to reuse and which objects we want to discard.


I encourage you to look into dependency injection containers.


For small applications, it is fine to do manual object composition.


But for larger projects, we can get a lot of benefit from a container.


We saw that containers offer us a number of benefits including auto-registration, auto-wiring, and lifetime management.


And we saw how to use Ninject in our scenario, creating and configuring the container, and then requesting objects from the container.


And we saw the same with Autofac.


In addition, we saw some different options for configuring the container depending on whether we want to use auto-registration or if we want to do manual registration.


And we saw late binding with Autofac.


In the multiple client scenario of our sample application, this is a great option.


Then we can keep the core application the same and provide unique data readers to our clients as needed.


And we saw the ASP.NET Core MVC dependency injection container.


With a parameter on the controller constructor, we can inject dependencies automatically by configuring them at startup.


We barely scratched the surface of dependency injection containers.


There is still much to learn.


But this gives us an idea of what they are capable of and why we want to use them.



### Course Summary

We have covered quite a few topics to help us get started with dependency injection starting with a definition.
我们讲解了一些话题帮助我们开始熟悉依赖注入，给出了依赖注入的定义。

Dependency injection is a set of software design principles and patterns that enable us to develop loosely-coupled code.
依赖注入是帮助我们开发解耦合代码的一些列软件设计原则的模式。

The focus on this is loose coupling.
重点在于解耦合。

We saw the problems when our application was tightly coupled.
我们看到了紧耦合的应用程序带来的问题。

Loose coupling opened up our code to a number of benefits.
解耦合给我们的代码带来了许多好处。

Those benefits include code that is easy to extend, easy to test, easy to maintain, facilitates parallel development, and facilitates late binding.
这些好处包括了易于扩展的代码，易于测试的代码，易于为维护的代码，有利于并行开发，有利于延迟绑定。

We specifically saw how we could easily extend code by swapping out the data readers and by adding client-side caching to our application.
特别地，我们看到了我们如何很容易地通过替换 data reader 来扩展代码以及增加应用程序客户端的缓存。

And we could add these features by simply composing our objects differently.
我们能够通过重组对象来很容易地增加这些功能。

We also saw how our code becomes much easier to unit test.
我们也看到了我们的代码如何变得更加容易进行单元测试。

We can isolate our code and add in fake objects with test data whether through a constructor or through a property.
我们能够将我们的代码独立开来，通过构造函数或者属性来增加假的对象

This gives us production code that is easy to read and write and also unit tests that are easy to read and write.
这给了我们易于阅读和编码的生产代码以及单元测试。

And we also saw late binding in action.
我们也实例讲解了延迟绑定。

This lets us make decisions at runtime rather than compile time.
这让我们能够在运行时而不是编译时作出决定。

Our example used Autofac, but we could do the same thing manually with a little bit of reflection code.
我们的例子中使用来 Autofac，但是我们也能够通过反射来实现。

It is the loose coupling that makes this possible.
这是解耦合才有可能达到的。

We also saw how loose coupling makes it easier to follow the SOLID principles whether we are eliminating responsibilities, like we did with our view model, or extending functionality, like we did with caching on the data readers.
我们也看了解耦合是如何更加容易地帮助我们遵守 SOLID 原则，无论是简化 view model 的职责还是为 data reader 扩展缓存功能。

There is more than one way to implement dependency injection.
实现依赖注入的方式不止一种。

Which pattern we use depends on what our specific needs are.
使用哪种模式取决于我们的需要。

We looked at constructor injection and property injection in the code.
在我们的代码中我们看了构造函数注入和属性注入。

These are the patterns that I have found most useful in my own work.
这是我们在工作中最有用的模式。

To use constructor injection, we add a parameter to the constructor.
为了使用构造函数注入，我们为构造函数加了一个参数。

In our view model, we have a dependency on a DataReader.


We have this dependency because we need to call the GetPeople method on that DataReader.


But rather than creating the object ourselves, we have the dataReader injected through the constructor.


This passes the responsibility to whoever creates the view model.
我们将依赖创建的职责抛给了创建 view model 的部分。

In the CSV data reader, we need to get data from a file on the file system.


By default, we want to use a real file loader.


But since we have a writeable property for the file loader, we can supply a different implementation.


For our unit tests, we can assign a FakeFileLoader with predictable test data.


This gives us full control over the behavior of the unit tests.


The goal of using these patterns is to break tight coupling, and we did just that in the code.
使用这些模式的目的是解耦合。

By adding constructor injection in the view model, we broke the coupling between our presentation layer and the data access layer.
通过在 view model 中增加构造函数注入，我们解耦了表现层和数据访问层。

After that coupling was broken, we could easily remove the service data reader that gets data from a web service, and replace it with a CSV data reader that gets data from a comma-separated values file on the file system.


We also saw how we could use the decorator pattern to wrap an existing data reader and add custom functionality.


With this pattern, we can simply snap our pieces together in a different order, and this will add caching to any of our existing data readers.


Loose coupling makes our unit tests much easier.


We can easily create tests that are five or six lines long, and more importantly, the tests are easy to understand.


This is true whether we use constructor injection or property injection for our tests.


And we spent a little bit of time looking at dependency injection containers.


The containers give us features such as auto-registration, auto-wiring, and lifetime management.


We have covered the basics, but there is still much to learn.


Where can you go from here? As a developer, I have found the SOLID design principles to be very helpful.


Pluralsight offers a course to help you dive deeper into understanding these principles.


You can also take a more thorough look at dependency injection containers.


Pluralsight offers courses on some of the more popular containers that we used here.


These will give you a better look at the capabilities, as well as recommendations on how to best use them.


And there are many advanced dependency injection concepts that can take you further in your understanding.


We mentioned lifetime management, but the next step is to fully understand the implications of each of the lifetimes.


This will give you a good idea of which lifetime you should choose for specific dependencies.


We also need to understand the differences between static dependencies and volatile dependencies.


This will help in deciding what objects should be injected and which can be more statically used.


If we get overzealous with dependency injection, we can end up with constructors with too many parameters.


There are different techniques for dealing with this including reducing dependencies, grouping dependencies, and using factory methods.


When we ask our containers to resolve dependencies for us, we may have trouble configuring strings and other primitive parameters like integers or date/time.


There are techniques out there to make this easier.


A big topic is interception.


We did a little bit of interception with the caching decorator.


We intercepted the GetPeople call and decided how to handle it.


But there are several different areas of our code that could benefit from interception.


And there are also a number of patterns we can use with dependency injection.


We used the decorator pattern to implement caching, but there are several other useful patterns including the null object pattern, the composite pattern, and the proxy pattern.


I have found these to be very helpful when solving dependency issues.


Thank you for joining me in Getting Started with Dependency Injection .NET.


With this foundation, you can take full advantage of what dependency injection has to offer.


Enjoy your journey.


