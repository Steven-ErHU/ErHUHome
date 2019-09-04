# Getting Started with Asynchronous Programming in .NET

## Author

### Filip Ekberg

Filip is an enthusiastic developer that strives to learn something new every day. With over a decade of experience in .NET, Filip actively spreads his knowledge and ideas around the globe, be it...

## Description

Utilizing asynchronous principles is crucial for building fast and responsive applications.
利用异步机制对于构建快速的，可相应的应用程序至关重要。

In this course, Getting Started with Asynchronous Programming in .NET, you’ll learn foundational knowledge to efficiently apply the asynchronous principles to build fast and solid applications.
本课程中，你将会学习到，有效应用异步机制对于构建快速且稳健的应用程序是至关重要的。

First, you’ll explore how the async and await keywords fit into your .NET applications, and how it ties together with the task parallel library.
首先，你会了解 async 和 await 关键字是如何加入到我们的 .Net 应用中的，以及它是如何与 task parallel library 绑定的。

Next, you’ll discover how asynchronous programming is different from parallel programming and how to use the parallel extensions to perform fast computations, which utilizes all your available processing power.
然后，你会发现异步编程和并行编程有什么不同，以及如何利用并行功能来获得快速计算，这将利用起你所有可用的处理器。

Finally, you’ll learn how to adapt in advanced scenarios, and where deeper knowledge of the internals may be required.
最后，你将学习如何在高级场景中应用，在这些高级场景中，你可能需要更深层次的知识。

When you’re finished with this course, you’ll have the skills and knowledge of how to apply the asynchronous programming principles in any type of .NET application.
通过这个课程，你将了解如何在所有 .NET 程序中应用异步编程的技能和知识。


### Content

* Course Overview
  * Course Overview
* Asynchronous Programming in .NET Using Async and Await
  * Asynchronous Programming in .NET
  * Introducing Async and Await in .NET
  * Understanding a Continuation
  * Creating Your Own Asynchronous Method
  * Handling an Exception
  * Best Practices
* Using the Task Parallel Library in .NET
  * Introducing a Task
  * Obtaining the Result of a Task
  * Handeling Success or Failure
  * Task Cancellation
  * Knowing When All or Any Task Completes
  * Precomputed Results of a Task
  * Process Tasks as They Complete
  * Controlling the Continuations Execution Context
  * Key Takeaways
* Parallel Programming Using the Parallel Extensions
  * Introducing Parallel Extensions
  * Processing a Collection of Data in Parallel
  * Working with Shared Variables and Collections
  * Summary
* Asynchronous Programming Deep Dive
  * Advanced Topics
  * Report on the Progress of a Task
  * Using Task Completion Source
  * Working with Attached and Detached Tasks
  * The Implications of Async and Await
  * Deadlocking
  * Asynchronous Streams
  * Summary and Final Words


## Transcript

### Course Overview

#### Course Overview

Hi everyone, my name is Filip Ekberg, and welcome to the course Getting Started with Asynchronous Programming in .NET.

I'm a principle consultant and CEO at a consultant agency operating out of Gothenburg in Sweden.

I started this company a few years ago and focused on building fast, powerful, and easy-to-maintain solutions.

This course is for those of you that want to build fast, responsive, and overall better applications by applying the asynchronous principles.

We'll cover all the topics that you need to understand to safely and effectively introduce asynchronous programming in your applications.

This includes introducing the async and await keywords and getting a complete understanding of how that affects the application and the potential problems that you may run into, also understanding how to use the Task Parallel Library to introduce your own asynchronous operations and how that fits into the bigger picture.

You'll also be familiar with the differences between the asynchronous and parallel programming and how to perform parallel computation using the Parallel Extensions.

Finally, you'll get an insight into the advanced topics, as well as the internals of async and await, which ultimately makes you appreciate all the effort the compiler is doing for us.

By the end of this course, you'll know how to effectively apply asynchronous and parallel principles by using the async and await keywords, the Task Parallel Library, and Parallel Extensions.

This gives you a good understanding of how that affects the application, the common issues you may run into, and how to adapt to more complex scenarios.

Before beginning this course, you should be familiar with programming in C#.

No prior knowledge of threading, asynchronous, or parallel programming is required.

I hope you join me in this journey to learn how to build fast, responsive, and powerful applications by applying the asynchronous principles with the course Getting Started with Asynchronous Programming in .NET, at Pluralsight.

本课程是给那些想要通过异步编程构建更快速的，可响应的，整体更好的应用程序。
我们将涵盖所有你需要理解的话题，以便安全有效地将异步编程引入你的程序。
这包括 async 和 await 关键字的介绍，并且让你理解，他们是如何影响你的应用程序，以及你可能会犯的一些潜在问题。此外，让你理解如何使用 Task Parallel Library 引入你自己的异步操作，以及如何更广泛的应用。
你也会熟悉异步编程和并行编程的区别，以及如何利用并行扩展来进行并行计算。
最后，你会了解一些高级话题，以及 async 和 await 的内部细节，让你感谢计算机为你做的一切。
在课程的最后，你会了解如何使用 async 和 await 关键字，Task Parallel Library 以及 Parallel Extensions 来有效地在程序中应用异步和并行机制。
这给了你更好的理解它们是如何影响你的程序的，理解一些你可能会遇到的常见问题，李连杰如何在更复杂的场景中应用它们。
在课程开始前，你应当数据 C# 编程。
不需要线程，异步，或者并行编程的知识。


### Asynchronous Programming in .NET Using Async and Await

#### Asynchronous Programming in .NET

Hey, this is Filip Ekberg, and welcome to the course Getting Started with Asynchronous Programming in .NET.

In this course, you will learn everything that you need to know in order for you to get started with asynchronous programming in your .NET applications.

In particular, we'll apply this in our .NET applications.

No matter if you're working in ASP.NET, console applications, WPF, WinForms, Xamarin, or other types of .NET Applications, all of the patterns and principles in this course will be applicable to your types of applications.

So in this module, we will be talking about asynchronous programming in .NET using the async and await keywords.

Before we jump into the code, let's first have a look at an application that doesn't leverage any of these asynchronous principles and then talk about how we can make this application a lot better.

In this particular application, we can search for stock prices.

So if I go ahead and search for the stock prices for Microsoft, and of course, this course isn't about learning about the stock prices or getting financial advice, but you'll notice here that the application locks up when I click Search.

The operating system is even noticing that our application locks up, and it's telling us that the application is no longer responding.

So let's jump over to the code and have a look the reason for this application to be locking up.

This here is the Click event handler for when I click Search inside my stock analyzer application.

This here is pretty much legacy code, but it's what a lot of us have to work with nowadays.

This here in particular is using a legacy code piece called a WebClient.

And in fact, a lot of us are probably having to battle using the WebClient in older projects, so this here illustrates a way for us to synchronously go ahead and download a string from a particular API.

Being synchronous means that it's going to run everything here on the same thread as our application UI.

This is also known as running everything on the UI thread.

Now let's have a look at an equivalent version that's using the asynchronous principles in the same type of application, and then we'll see what the difference is between using the synchronous and asynchronous version and why it's so important for our applications to apply the asynchronous principles.

You'll notice here that when I search for the Microsoft ticker to retrieve all the stock information for the Microsoft ticker, you'll notice that I can start taking notes in the application, meanwhile, this here is loading, and you also notice a loading indicator at the bottom of our applications.

This is a vast improvement to the user experience in the application.

This version of the application leverages asynchronous principles, which means that we can offload work to a different thread to go ahead and load all this information from the API without locking up the UI thread of our application.

You'll notice that there is not really a big difference between the synchronous and the asynchronous version of the code.

There is a few different classes and a few different keywords.

Instead of using the old legacy WebClient, we're now introducing the HttpClient, which only allows us to perform asynchronous operations against our web resources.

So we can go ahead and use the HttpClient to go ahead and get all the information for the stocks for our particular ticker now because GetAsync is an asynchronous operation.

This means that the operation will not lock up the current thread.

And since the code we're originating from the UI thread, that means that we are relieving our UI thread of work so the application can go ahead and operate on more user input.

You'll also notice here that we are introducing the async and await keywords.

The async keyword is a way for us to indicate that this method here will contain asynchronous operations.

The await keyword is a way for us to indicate that we want to get back to this part of the code once the data is loaded from out API.

So essentially, the biggest reason for introducing asynchronous principles is to improve the experience for your users by relieving work from the current thread, which in most cases could be the UI thread.

Traditionally, we had different ways of working with multi-threaded approaches in our applications.

We could of course have used the lower-level threading in our applications, or we could leverage something like the background worker, which is an event-based asynchronous pattern.

Nowadays, most people used to Task Parallel Library coupled with the async and await keywords.

So with very minimum effort, our application transitioned from a synchronous approach that locked up the application and gave the user a really bad experience to an application that leverages asynchronous principles, gives the user information about things that are happening in the background, and then allowing the user to continue working with the application as our data is being loaded.

This here shows you why it's so important to learn and apply the asynchronous principles in all your different types of applications.

#### Introducing Async and Await in .NET

We're now back looking at the legacy code pieces that we have that leverages the WebClient.

We certainly want to get rid of this code and make sure that our application now leverages the HttpClient and the asynchronous principles.

A very common thing to first try out when you encounter asynchronous principles in .NET is to simply mark your method with the async keyword.

Let's go ahead and try that and see how that affects our application.

You'll notice here that I can mark my Click handler as async.

Let's just run the application and see if this had an affect on the performance of our application.

As I search for Microsoft, you'll quickly notice here that the application still locks up.

Our operating system will tell us that the application is not responding, and then after a little while, we'll get the data back to our application.

Let's jump into the code and talk about why this is still not an asynchronous operation.

As you see here, Visual Studio will tell us that this method is marked as async, but it lacks the await keyword.

So the code inside this method will still run synchronously, and that's a big problem because we want to leverage the asynchronous principles.

So what we need to do is to make sure that whenever we encounter the async keyword, we also have the await keyword inside that same method.

So simply enough, we replace the WebClient with the new HttpClient, which is a class that allows us to asynchronously interact with our web resources.

Now asynchronous patterns and principles are not only for communicating for our web resources.

Asynchronous principles is suited for any type of I/O operations.

As we do in this case, we interact with an API over the web, but it could also be reading and writing from disk or memory or do things like database operations.

In our case here, we're going to go ahead and fetch some data from our API using the GetAsync method on our HttpClient.

Now this here will return something.

GetAsync, in fact, returns a task of an HttpResponseMessage, a task which we will be talking more about in the next module is a representation of our asynchronous operation.

This asynchronous operation happens on a different thread.

Now in order for us to get the result out of this operation, which is the HttpResponseMessage, we need a way for us to notify our application that the result is ready.

So in this case here, the response variable is in fact our Task that's a representation of our asynchronous operation.

So if we were to, for instance, ask for the Result here, which is one of the first things that people try to get the Result out of their asynchronous operation, this is actually a really bad idea because what happens here is that we are requesting the result out of this asynchronous operation.

It will actually block the thread until this Result is available, so this is really problematic because this means that a code will run synchronously.

So instead of calling response.Result, how do we make sure that we get the HttpResponseMessage out of our asynchronous operation and only proceed when this done? Of course, we introduce the await keyword.

The await keyword is a way for us to indicate that we want to get the Result out of this asynchronous operation only once the data is available without blocking the current thread.

This here gives us the HttpResponseMessage.

We also need to make sure that we read the content, and you'll see here that ReadAsString is also an asynchronous operation, and it hints us here that we need to await this as well because we could of course say ReadAsStringAsync and then call the Result property, but this would block again and make this code run synchronously, and in a lot of cases, calling .Result or .Wait will in fact deadlock the application.

So let's really avoid calling .Result or .Wait.

So this here allows us to get the HttpResponseMessage out of our GetAsync operation into the response variable that we have on our left-hand side once the response is available, and then we'll proceed down to the next line once that is ready without blocking our UI thread in our application.

So whenever we use the await keyword, the variable that we have on the left-hand side will always contain the result out of our asynchronous operation.

So now if we run the application, this should perform a lot better than it did earlier.

You'll notice here that once we search for Microsoft, we see the loading indicator, and after a little while, the data will be presented into our user interface, everything without locking up the UI, allowing the user to continue to work with the application.

The asynchronous principles that we talk about in our applications is not only meant for Windows application or mobile applications.

We can also apply the same principle to the server-side code in ASP.NET.

This here illustrates a home controller inside a web project that's allowing us to pretty much do the same thing that we do in our Windows application.

You can see here that we have the async keyword.

Our action inside of our controller returns a Task of ActionResult.

This means that ASP.NET will have a reference to the ongoing asynchronous operations and will then, when all the results are available, get the ActionResult out of this action.

You can also see that we have a DataStore.

From the DataStore, we call LoadStocks, which is an asynchronous operation.

Nowadays, a lot of people don't suffix their methods with the async keyword because a lot of IDs will hint to you that you need to await this and that it's in fact returning a task.

Whenever you have a task inside your asynchronous method here, you pretty much always want to await that.

So in order for us to get these stocks out of this LoadStocks operation that's ongoing, we introduce the await keyword, and then we get the data into the variable on the left, and then we return that to the View, and then to populate that and return that back to our caller.

Now what's interesting here is that this is not in fact making the client asynchronous.

You'll see here that I've requested the stocks for Microsoft, and this took a little while to load, and you did notice that it wasn't in fact an asynchronous operation.

So the big benefit of using async and await inside ASP.NET is to relieve IIS or the web server that you were using so that it can go ahead and work with other requests as your data is being loaded from disk, the database, or from another API.

And if we peek inside the DataStore, there is another method in here called LoadCompanies.

LoadCompanies is an asynchronous method as well.

This here allows us to work with the file system in an asynchronous manner.

So as mentioned earlier, asynchronous operations are not only for calling things over the web.

It's also for talking to your file system, your memory, or for instance, a database.

So as you notice here, the asynchronous principles are really powerful no matter if we are working in ASP.NET, in Windows, or any type of .NET applications.

#### Understanding a Continuation

Up until now, we've talked about marking our methods as async, introducing the await keyword, and the fact that our asynchronous operation performs its operation on a separate thread, avoiding to lock up our UI thread or the main thread in the application.

You're probably wondering now what the await keyword really does in the application and what it does to the flow of our code.

Now introducing the await keyword, as we've mentioned earlier, allows us to retrieve the result out of our asynchronous operation when that's available.

It also makes sure that there is no exceptions or problems with the Task that it's currently awaiting.

So not only is the await keyword a great way for us to get the Result out of the asynchronous operation.

It also validates the current operation.

What it's also doing is introducing something called a continuation.

A continuation is the block of code that's being executed after the await keyword.

So in our case here, we perform an asynchronous operation to go ahead and retrieve some stocks information from our API.

This here puts all the code beneath it inside something called the continuation.

The continuation is the code that's executed after the asynchronous operation is completed.

And of course, then we have a second await keyword, which in its turn introduces a continuation for the code beneath that as well.

You can have as many await keywords as you want inside your asynchronous method.

They will all introduce a continuation, which allows you to make sure that the code beneath the await keyword is only executed once the asynchronous operation that you're awaiting is completed.

Now to illustrate this, let's make sure that the response that we got back from our API was in fact a successful response.

We can do this by ensuring the SuccessStatusCode for our web request.

So now, we've introduced the EnsureSuccessStatusCode.

So EnsureSuccessStatusCode will in fact throw an exception, and we don't want to proceed reading the content if there is Status 200 OK coming back from the server.

So what we'll do here is we'll wrap all the code in the continuation inside a try and catch block to make sure that we can catch the exceptions that could potentially occur.

We'll update the Notes in the application with the Exception message that we're getting if we're catching something that's not completing successfully here.

This here illustrates that we are now inside the continuation.

We are back to our UI thread once our asynchronous operation is completed.

The await keyword ensures that we are back to the original context, which in our case is the UI thread.

The UI thread will allow us to update and work with the UI.

Just as we were updating our data grid, our Stocks.ItemsSource when we're getting data back from the API, we can interact with the Notes.Text to update that with the error message that we're potentially getting if there is not a successful status code coming back from our API.

So this here illustrates how we can, inside the continuation, work in the same context that we originally spawned our asynchronous operation from.

We'll search for a ticker that we know doesn't exist.

I'll search for my company name because, frankly, I know my company is not publicly traded.

We'll click Search here, and after a little while, we'll see here that Notes is now populated with the Response status code does not indicate success.

We got a 404 Not Found back.

That's because it couldn't find the stock.

So this is frankly a great addition to our application.

It's now telling us when it can find the ticker, and the fact that we now understand that after the await keyword, we are inside something called a continuation, And when using the await keyword, the continuation allows us to work on the original context, and This means that we don't have to worry about working across different threads.

It makes our lives a whole lot easier.

So not only does the await keyword allow us to retrieve the result out of the asynchronous operation, it also allows us to validate that there are no problems by checking that the asynchronous operation didn't throw any exceptions, as well as after the asynchronous operation has completed, we are back to the original context.

And comparing this to other approaches that we've seen in the past, this makes it a whole lot easier to work with our applications.

The code becomes more readable and a lot more maintainable as well.

#### Creating Your Own Asynchronous Method

We all know that we shouldn't really add too much code inside our methods.

We should keep our methods pretty clean, so I recommend that we refactor this code a little bit and make sure that we also learn about introducing our own asynchronous methods at the same time.

So let's go ahead and create this method inside the application.

We will then call this method from our Search_Click event handler.

The first thing that we'll do is that we'll introduce this method that we call GetStocks.

We have two different options.

Either we can make sure that GetStocks returns the stocks that it's loading from our API, or in this case here, since we are doing all the code inside our WPF application, we can just interact with the UI from the same method.

If we choose to just do all the work inside GetStocks, we could potentially just move everything over from the Search_Click event handler into GetStocks here.

But before we do that, let's talk about a few things first.

In order for us to introduce an asynchronous method, we know that we can introduce the async keyword.

Marking a method as async indicates that this method will have the capability of executing asynchronous operation that we are then awaiting inside the same context.

If we don't have the await keyword, we don't need the async keyword either.

Now you'll notice here that I marked this method as something that I called async void.

Async void is pretty much evil and is something that you should always avoid if you can.

So how come you're allowed to do async void if it's such an evil combination? The reason is, of course, event handlers.

if you want to have asynchronous code inside your event handlers, the delegate for an event is most certainly returning void.

So the only time you're allowed to do async void is for your event handlers.

Now keep that in mind.

So if we're not doing async void, what do we do? Instead of marking these as async void, I'll mark this as async Task.

Marking this as async Task means that the method will in fact automatically return a reference to the ongoing operation, which you could then await somewhere else.

You'll notice here that we are not getting any compilation errors.

We're not getting any errors that were not returning anything from the method.

That's because whenever we mark something as async and the return type is of Task, we don't have to return anything because compiler will do all of that for us.

Now we'll talk more about the task in the next module, and we'll talk more about the magic that the compiler generates later on in the course, so this here now allows us to populate this method with asynchronous operations that will then use the await keyword to await.

And it's marked as async Task because that allows us to use the await keyword, as well as then getting a reference to the ongoing operation whenever we call this method.

So we're going to add all the code into our method here that we had in our Search_Click event handler that talked to our API.

This here will do exactly what we've done before.

It'll go ahead and get things from our API, it'll ensure the status code, it'll convert the JSON into our IEnumerable of StockPrices and then populate our data grid, and if there's a problem, it'll update our Notes.

So now we've introduced our own first asynchronous method, and we've followed the best practice of not returning void from an asynchronous operation.

Now let's go ahead and go up to our click event handler and call this method.

We'll still have things happening before and after we want to call this thing here, and that's just code for showing the loading indicator and hiding the loading indicator when the work is done.

And you'll notice that the Search_Click event handler is still marked as async.

That's because we want to call GetStocks, and GetStocks is an asynchronous operation.

So, you know, when we call GetStocks here, we also want to make sure that the operation completed successfully, so we'll introduce the await keyword.

Now what happened here is that we refactored our code into our own asynchronous method.

We cleaned it up a little bit and made sure that we have minimum amount of code inside our async void method.

And of course, running this here, you'll see that it still works.

We can still search for all the stocks, it'll populate our data grid, and if we search for a ticker that doesn't exist, that'll populate our Notes and tell us that it doesn't exist and that we got a 404 back from our API.

So in fact, it was super easy for us to refactor our code into our own asynchronous method, and when we call this method, we want to make sure that we await this as well because you've noticed that GetStock doesn't return anything by itself.

I mentioned earlier that the compiler takes care of returning the reference to the ongoing operation for us, and we've talked about earlier that the await keyword is something that helps us get a result out of our operation, but we also talked about the fact that it's there to help us validate that the operation is completed successfully.

Now in our case here, GetStock doesn't return anything.

Well, it does in fact return the Task, but the Task is just the ongoing asynchronous operation.

But we still use the await keyword, and that's because you should always use the await keyword when you call something that's asynchronous.

We normally refer to these as using async all the way up.

So at the top level, in this case, the Click event handler, we want to make sure that we await our asynchronous operation.

Because if there is a problem inside the asynchronous operation, we want to make sure that it's validated and not just lost somewhere along the way.

So this here showed you that it's super simple for us to introduce our own asynchronous method.

By refactoring our code that we had here, it made our code a little bit more readable, and do remember that we could apply the same approach inside ASP.NET, a console application, Xamarin, or any type of .NET application.

#### Handling an Exception

Given everything that we've looked at so far, an asynchronous programming seems really handy, and it's something that we really want to introduce in our applications, especially if we want to increase the user experience in our applications, although sometimes the asynchronous operations might fail.

And we've talked about the fact that the await keyword is a way for us to validate that the asynchronous operation performs successfully.

I know that when I call GetStocks now, an error will be occurring because I've changed the URL to my API.

So I know that the request is going to fail, and the await keyword here makes sure that this is propagated back to the caller.

But what happens if we remove the await keyword? In fact, what you'll notice here is that nothing happened.

It'll tell us at the bottom of the application that the stocks are loaded, but we cannot see anything at all.

This here proves that if we don't use the await keyword, our exceptions will be swallowed.

They will be swallowed by the Task that is a reference to the ongoing operation.

I did mention earlier that async void is something that you really want to avoid, and let me show you why that is.

Remember earlier, I said that when we mark something as async, it'll automatically return a Task for us if we so decide.

But if we mark the method as async void, that'll also work.

So in the case that we have here, we know that the task that represents the work for GetStocks will capture our exception.

Because if we add the await keyword again, that'll propagate the exception back to our application.

But what happens if we change the signature of GetStocks to async void? Let's rerun the application and see what happens.

Now when we run this application again without the debugger attached, notice what happens.

You'll see here that the application just terminated.

The application in fact crashed because what happened was that the exception that we got thrown inside GetStocks couldn't be set on any particular task, so there is no task available for us to swallow the exceptions.

Now that's problematic.

But being great developers as we are, we simply try and catch that inside our Click event handler.

So when we run this particular code, we would probably expect the application to simply swallow the exception and do as it did before and tell us that it loaded the stock data, but then not propagate anything anything inside our data grid.

But in fact, we got the same problem that we had earlier.

It is still tearing down our application.

This is the problem with async void.

Async void is really terrible and will make sure that your application crashes if there is an unhandled exception inside your asynchronous method.

So how do we fix this? Well, simply don't write any code that causes any exceptions, and you'll be totally fine.

But that's not really realistic, is it? So what we do instead is that we change the signature back again to async Task, and as for our event click handler, we need to make sure that our asynchronous operation completed successfully.

Now what we've done here is that we've made sure that no code that we have inside our async void method can throw an exception.

So what you do is you minimize the potential errors that you could have in your methods that are marked as async void, and you always want to make sure that you use the await keyword to validate that there is no exceptions inside your asynchronous operations.

And you even see here that we get a better experience inside our application.

As we search for Microsoft, immediately, we'll see here in the Notes section that it's telling us that an error occurred while sending the request.

So when trying to catch our exceptions, it's really important that we await the Tasks all the way up the chain and make sure that if something returns a Task, we want to make sure that we await that somewhere.

We don't simply want our Tasks to be fired and forgotten and then swallow potential exceptions because then we'll never know if there was a problem.

So avoid async void and always make sure that you await your asynchronous operations.

#### Best Practices

As we've progressed throughout this module, we've learned all that we need to know in order for us to start working with the async and await keywords inside our .NET applications.

Now remember, it doesn't matter if we are working in WPF, WinForms, Xamarin, console applications, or ASP.NET applications.

You can use these practices and principles in all these different types of .NET applications.

This means that you can leverage asynchronous principles across all your different types of applications.

The only thing that's really a big difference is the fact that ASP.NET doesn't have the UI.

Instead, what happens is that in ASP.NET, we relieve the web server of work so that it can take care of other requests while your asynchronous operation is ongoing.

Now we've looked at a lot of interesting things in this module, and we've learned some dos and don'ts.

Particularly, you want to make sure that you avoid using async void in your applications unless it's for a Click event handler.

But if you do end up using async void in your applications, make sure that the code inside your method doesn't throw any exceptions.

I know that this is really hard, but just make sure that you wrap things in a try and catch block so that you can recover from potential problems.

We also talked about the fact that you should really avoid doing .Result or .Wait on your asynchronous operation instead of using the await keyword.

As you'll notice here that if we change GetStocks to .Wait instead and run the application, you'll see that it locks up the application just like the synchronous version of the application did.

The application in fact performs a lot worse than the synchronous version.

This application actually dead locked, and that's a really big problem.

When we use the Result property or call the Wait method on our asynchronous operations, not only are we potentially locking the application until the data is available, in this case here, we in fact deadlocked the entire applications.

This is a pretty bad user experience, so just make sure that you avoid the Result property or the Wait method on your asynchronous operations, although I do want to mention that in the continuation after you've done await, it is totally fine to use the Result property.

So that's pretty much covering the don'ts in asynchronous programming using async and await keywords.

The dos and the things that you really should always try to aim for is to use the async and await keywords together.

If you mark your method as async, make sure that you use the await keyword otherwise you will just introduce and generate a lot of unnecessary code in your application that's not really leveraging any asynchronous principles.

Make sure that you mark your methods as async Task or async Task of T instead of using async void.

That way you can validate the success of that asynchronous operation.

And finally, what you want to make sure is that you await your chain of asynchronous operations to make sure that they all complete successfully, so use async and await all the way up.

I hope you enjoyed this module getting into the async and await keywords in your .NET applications.

There are still a ton of things that we need to cover in this course for you to get started with your asynchronous programming in .NET.

Next up, we'll talk more about the Task and how to work with that and how it's a little bit different using the continuations on a Task rather than using the await keyword.

Then of course, we'll talk about parallel programming, and then we'll deep dive into a little bit ASP.NET, as well as what really happens when we apply the async and await keywords.

So stay tuned for that.

So I really hope that you're as excited as I am to proceed in this course.

### Using the Task Parallel Library in .NET

#### Introducing a Task

Hey, this is Filip Ekberg, and you're watching Getting Started with Asynchronous Programming in .NET.

In this module, we'll talk about using the Task Parallel Library in .NET, also commonly referred to as the TPL.

And remember that everything that we talk about in regards to how you work with the tasks, how you grab exceptions, how we get the result, and how you introduce this in your applications is the same no matter if you're working in WinForms, WPF, Xamarin, ASP.NET, console applications, or any types of .NET applications.

In this module, we'll talk about how to introduce tasks into applications.

We'll talk about obtaining the result, how to work with exceptions, and how to run code after the asynchronous operation is done without using the async and await keywords, as well as running particular continuations depending on if the task succeeded or failed, and then we'll talk about canceling Tasks and waiting for one or many Tasks to complete before continuing to execute the code in your method.

Now we still have this Stocks application that allows us to load stock data.

Someone came up with the idea that we need to introduce offline support in the application.

Now this is a great addition, and I've been tasked, pun intended, to introduce this in the application.

So as I search for Microsoft, you'll notice that the user experience has degraded to what we had in the start of the previous module.

The application works in a synchronous manner and takes about 2.2 seconds to load all the data and populate our data grid.

The reason for this is because we load a large file without using an asynchronous approach.

Then we can wrap the text into our list of stock prices.

Then we populate our data grid with the particular tickers that we are looking for.

So the code that we have here is obviously blocking the application.

It's a synchronous code block that runs on our UI thread, so no wonder our application is locking up.

And the first thing that you'll probably check out now is that if there's an asynchronous version of Read lines available on our file class here.

You'll notice though that there is only ReadAllBytes, ReadAllLines, ReadAllText, and ReadLines.

So File here doesn't in fact allows us to work asynchronously with our file system.

Now of course, there are other ways in the .NET Framework to work the file system in an asynchronous manner.

But in a lot of cases, a lot of us use packages that has a lot of great code in them, but sometimes they don't expose any asynchronous versions.

So we need a way for us to introduce these asynchronous principles without relying on the libraries that we use to introduce this for us.

So how do we approach this? Well, one way for us to introduce the asynchronous principles is by introducing what we call the Task.

The Task is a way for us to represent an asynchronous operation.

It allows us to get the result out of the asynchronous operation, to schedule work to be executed once the asynchronous operation is done, as well as knowing if there is a problem, canceling the operation, among other things.

So what we'll do is that we'll use the Task to take all this code here and run this somewhere else.

You'll see here that we have two different Task.Run.

The generic version, of course, represents a Task that will return a value after it's completed, but we don't explicitly use the generic version because if we return something from our action, it will just be inferred.

So let's just going ahead and use Task.Run here.

Task.Run will queue the specific work to run on the thread pool and returns a task that represents the ongoing work.

Everything inside our action here will now executed somewhere else other than in our UI thread.

So now what we're doing is that everything that we had in our anonymous method here will be executed on a different thread, and that is totally awesome.

So now we've moved all our synchronous code here to be executed somewhere else.

The problem though when we run the application, it will tell us it took 0 ms to load the data, and it doesn't in fact populate our grid view with any data at all.

Of course, what happens here is that when we try to populate our Stocks.ItemSource, we can't do that because that lives on a separate thread, so that's a little bit problematic.

So what's in fact happening is that we are getting an exception.

We're trying to access an object that's owned by a different thread.

So how do we solve that, you might ask.

Well, we can introduce a way for us to communicate with the thread that owns our UI.

Particularly, in WPF, we use something called the dispatcher.

In WinForms, and Xamarin, and other UI frameworks, there are similar ways to do this.

So we'll use the dispatcher to invoke something on our UI.

So now when we search for Microsoft, you'll notice that it didn't lock up the application, and after a little while, we got all the data into our data grid, although there is a little bug in the application.

Notice that it told us that it took 6 ms to load the data.

I know for a fact that it takes about 2 seconds to load the data into memory and then processes that and add it to our data grid.

So what happens here is that the Task Scheduler will queue this work onto the thread pool, and it'll just execute that whenever there is an available thread.

But what really happens here is that queuing the work completes instantly.

This means that the code after our Task.Run will execute immediately.

It goes ahead and runs our code block that we call After stock data is loaded, so we'll fix that in a little bit.

Before we do that, there is something I want you to keep in mind though.

When converting your synchronous code into asynchronous code, make sure that the code that you have inside your asynchronous versions of your previously synchronous code does not force a block on the UI.

That could, for instance, be executing long-running operations using things like the Dispatcher.Invoke.

So just keep in mind that when you take previously synchronous code and wrap that in a Task.Run, you want to be able to guarantee that there is nothing in that that will block your UI thread.

So now let's go ahead and simply fix the bug to make sure that the code after Task.Run isn't executed until this asynchronous operation is completed.

Since you've hopefully watched the previous module, you know that we can simply introduce the async and await keywords.

So what we are saying now is that we queue all the work to be executed somewhere else, and when we are notified that the work is completed, we can go ahead and run the code after this block, which will make sure that the user gets a pretty good experience in our application, which means that we get the loading indicator at the bottom, it'll tell us that it took about 2.4 seconds to load the data, and again, we are back to where we were at the end of the previous module.

So let's now hear how easy it is for us to introduce the task to schedule work to be executed somewhere else.

A lot of the time, we might have portions of code that take a little bit of time to run, or we use libraries that don't expose any any synchronous versions.

These cases are the perfect fit for where we want to introduce Task.Run to execute our asynchronous operations.

#### Obtaining the Result of a Task

I simply got rid of the async and await keywords because we want to learn how we can do this without leveraging those two keywords.

Ultimately, what we have here is two kind of expensive operations.

The first one is reading all the files from our disk.

That's the obvious one that's taking a long time.

Then when we've loaded all the lines, we want to process that, and this process will iterate over each line in our file.

And given that the file is pretty large, this operation takes a little while to complete, which is why we want to avoid running this on the UI thread, and then we want to populate the UI.

So we have those two different operations.

If we were to change our code up a little bit here to say that we first load all the lines, and then when we have those lines, the asynchronous operation returns that.

This here indicates that we have an asynchronous operation that returns an array of strings.

So we could, of course, use the generic version of Task.Run, but since this is inferred, we don't really need to do that.

In order for us to get the result out of our Task here, let's capture our Task in a local variable.

This here now loads us to either use the async and await keywords in order for us to retrieve all the lines out of this asynchronous operation, or we can introduce a continuation.

The way that we introduce a continuation without using the async and await keywords is by chaining a continuation onto our Task.

You'll see here that we have a method called ContinueWith on our Task.

This here creates a continuation that executes asynchronous when the target Task is completed.

This means that the continuation is also executed on a different thread.

And just as we did with Task.Run, we can represent the operation that we want to run using an anonymous action.

This method will get a Task passed to it when it's executing.

The Task that we get passed into ContinueWith is in fact the same thing as our loadLinesTask.

This here allows us to grab things like the Result or potential exceptions.

So how do we get the result out of our Task? Do you remember the Result property that I told you to never use? Well, you're actually going to use that now.

If you recall, I mentioned that you're allowed to use the Result property as long as the Task has completed.

Because in this case here, we will actually have a Result inside the Result property; therefore, it doesn't lock any threads.

And of course, the Result here will give us and array of strings.

So now if we simply add the code that we had earlier into our continuation here, we can say that we get the lines out of our Result.

So now we chained this continuation onto our particular Task.

What's also interesting here is that ContinueWith in fact returns a Task as well.

Because the continuation will execute asynchronously, that means we get a reference to that asynchronous operation as well.

That means that you could chain another continuation, which returns a Task, and then you can chain another continuation, and so forth.

You can have as many continuations as you'd like.

And of course, we still need to do the Dispatcher.Invoke.

As this is an asynchronous operation, it'll run somewhere else.

So we need to use the dispatcher in order for us to update our UI, so let's make sure that we also add the section of After stock data is loaded into a separate continuation.

So now I have a reference to the Tasks that process our stocks, so let's just make sure that our After stock data is loaded is executed in the continuation of that.

In this final continuation, I don't really care about the Task that just completed, so I'm simply not going to care in anonymous method.

So what we do now is that we introduce an asynchronous operation that would load our files from disk.

It'll then return the array of strings back from that asynchronous operation, and as that completes, we convert all those lines into our StockPrice objects, populate our UI, and when that process is also done, we go ahead and remove the loading indicator in our application.

The application is now as good as the one that we had when we used the async and await keywords.

It doesn't lock up, and it allows us to schedule the work to be executed once these different asynchronous operations are completed.

Of course, if we compare these to the async and await approach, this here is a little bit more chatty.

With a bit more code, it's more error prone, and it doesn't read as nice as the async and await version did.

There is also a big difference that the continuation is in this case executed on a different thread, which is a little bit problematic.

That means that we need to do the Dispatcher.Invoke every time we want to talk to the UI.

So this here allows us to work with the result of our Task.

We can grab the result inside our continuation.

And you'll notice here that if we try to load a file that doesn't exist, nothing happens in the application, except for the fact that the final continuation did in fact remove the loading indicator and update how long it took to execute this here.

We'll talk more about exceptions later on, but you notice here that it tried to load the stocks, that Task failed, then it started executing the continuation, and because there is no Result available, that threw an exception, which will then trigger the final continuation.

But more on that later on.

That just shows you that there is still a long way to go to make this as good as our async and await version was.

Before we move on and talk about handling success and failure, I want you to keep in mind that these asynchronous operations could spawn different asynchronous operations themselves.

They could even leverage the async and await keywords inside themselves.

So imagine that we found a way for us to read the files asynchronous from our file system and we could leverage the async and await keywords without changing too much in our application to make it work.

Because these asynchronous operations can of course spawn asynchronous operations inside themselves.

So let's say that we have a code block here that allows us to run asynchronous code.

This here will open up a stream to the file that we have on disk.

Then we'll have to use the async keyword.

But how do we use the async keyword inside this anonymous method? Well, we mark it as async.

Marking the anonymous method as async means that this will be an anonymous method that returns a Task.

It'll not be async void if that's what you were thinking, so this here will allows us to use the async and await keywords inside this task itself.

Of course, that allows us to search for Microsoft in the application, it gives us the particular stock prices out of our files, even though we are now using async and await inside a separate task, so you can combine this in whichever way you like.

This here just illustrates that we can spawn asynchronous operations out of our already executing asynchronous operations.

But let's go back to the a little bit more readable code that we just had that loads all the lines from our file on disk and wraps this in an asynchronous operation.

Now next up, we'll talk about continuations where we can separate handing the continuation if it's a success or failure.

Because what happens when there is a problem with our asynchronous operations? How do we capture and handle the exceptions? More about that, coming up.

#### Handeling Success or Failure

Of course, in many situations when we work in our applications, we want ways to handle exceptions or just execute code when there is a successful execution of our asynchronous operations.

I know for a fact here that I don't have the file called ABC.csv, which means that we are going to get an exception when we execute the code.

So would you imagine that this is going to execute our continuation? Of course, since I have the debugger attached, you'll see here that it's going to tell us that it couldn't find the file ABC.csv.

But then when we proceed, you'll see that it in fact executes our continuation.

The continuation is promised to be executed once our asynchronous operation is completed, no matter if it's a successful operation or not.

You'll see here in our Task that we get in our continuation, there is in fact an Exception, And the status of our asynchronous operation is faulted.

You'll see here that it's telling us that InnerException indicates that it couldn't load the file.

Now since we're using the Task Parallel Library and not using the async and await keywords, the exception that we get here is an aggregate exception, so we'll have to look at the InnerException to know that it couldn't find the file.

Now of course, what happens in this case is that if we continue executing this here with a breakpoint in our next continuation, you'll see that it's telling us that when we call the Result property, one or more problems occurred.

This means that it's going to throw an exception on the current Task and run the continuation of that particular Task as well.

Now in this continuation, we don't capture capture the Task.

But all this is doing is updating the UI, so you're probably wondering is there a way for us to indicate that we only want to execute this code here when the previous operation completed successfully? In fact, on our continuation, there is something called the continuationOptions.

This here allows us to specify behaviors through the scheduler.

We can, for instance, say that it should only execute this continuation when the status of our task is not faulted, or for instance, we can turn it around and say that it should only execute this when the task are ran to completion.

So if we specify this here, it will indicate that it should only execute this continuation when our loadLinesTask completed successfully, meaning there is no exceptions or it's not canceled.

And again, if we release the debugger now, you'll see here that it simply skipped our loadLinesTask continuation, which is marked as only run this if the task ran to completion.

Of course, this also means that we can introduce continuations that only execute when there is a problem.

So we could, for instance, say that whenever loadLinesTask faulted, we're going to send a message to our UI, so now we've specified a continuation that's going to update our Notes.Text with the message of the InnerException.

We also need to say now that this only executes when the task that we're continuing on is faulted.

And again, we do this by introducing the TaskContinuationOptions.

And we can say that we only want to execute this when it's faulted.

And you can see here the notes are now updated to say that it couldn't find the file ABC.csv.

So with very minimum effort, we chained on a continuation that the scheduler will only execute if the task that it's currently processing faulted.

This here allows us to have multiple different continuations that matches our expected outcome of the asynchronous operation.

This here was a more common way of doing it prior to the async and await keywords.

Of course, you see here that we get an aggregate exception.

We don't get an aggregate exception if we're using the async and await keywords.

So of course, a better approach would be to use the await keyword to validate our task and then catch potential exceptions.

But you'll already have multiple different continuations in your project and you want to make sure that one of them is only executed when there is no problems, you can apply the TaskContinuationOptions.

And do remember that the ContinueWith block is a task itself.

So if there is a problem in this code here, it'll throw an exception and then it will execute the next continuation in line.

This here illustrates how we can introduce a chain of tasks where some of them will only be executed on certain conditions.

So no matter if you are using the async or await keywords or if you're using the Task Parallel Library using the ContinueWith method and make sure that you validate your tasks, as well as your continuations because none of us wants unexpected behaviors in our applications and handling the success or failure, either using the async or await keyword or the Task Parallel Library like this, is so simple that everyone should do it in their applications.

#### Task Cancellation

In some cases, you want ways to cancel your long-running operations, especially if you're doing API calls or loading things from disk that can be potentially expensive in terms of taking a little bit of time, so we want our users to have the capability of canceling their current operation.

So in our stocks application, I'm going to search for the Microsoft ticker, but I accidentally added an extra character at the end of the name of our ticker.

So now when I search for Microsoft here, I want to immediately cancel this because I know that this goes on and loads a large file from disk, and that is a pretty expensive operation.

So you notice that we could immediately cancel this operation.

It's telling us that the cancelation was requested, and it's also telling us how many rows it actually loaded from our file from disk, but then it didn't go ahead and process the data and add that to the UI because we asked this to cancel the ongoing operation.

The code change that had to be made in order for us to make this work isn't too large.

We introduced something called the CancellationTokenSource, which is something that we can use to indicate that we want to cancel an operation.

The CancellationTokenSource is coupled with something called the CancellationToken.

The Cancellationtoken is what we pass to asynchronous operations, which they can then use to indicate if it's canceled or not.

So the pattern that we were using to change our Search button to a Cancel button is to first check if our CancellationTokenSource is initialized.

If we already have a CancellationTokenSource, that means that we've executed this part of the code before.

And if we have the CancellationTokenSource, we'll signal that we want to cancel the current operation.

Then we'll set the CancellationTokenSource to null and return from the Click event handler.

This will, of course, signal to the previously executed asynchronous operation that the Search_Click event handler triggered to say that it should now cancel the ongoing operations, and that will in its turn trigger those continuations and so forth.

But if we already have the CancellationTokenSource, there is no reason for us to continue processing the Search_Click event handler after resetting the CancellationTokenSource because that would only trigger a new search for our stocks, and that's not what we want when we cancel the operation.

This will allow anyone that's leveraging the CancellationToken to know that the current operation has been requested to be canceled.

To make the Click event handler a little bit more readable, I extracted the code that loads the file from disk to a different method.

I'm calling this SearchForStocks.

All this is doing is leveraging the asynchronous principles to load each line from disk one by one.

So SearchForStocks is pretty much the first place that we want to introduce the CancelLationToken in.

We need to pass the CancellationToken into SearchForStocks in order for us to be able to tell our loadLinesTask to cancel if that's requested.

On Task.Run, we have an overload that allows us to pass a CancellationToken, and of course, we need to pass this when we call the method as well, and we get the CancellationToken out of the CancellationTokenSource.

And when we reach this step here when we call SearchForStocks, we know that we have a new CancellationTokenSource.

If it's the second time we run the Click event handler, what happens is that we already have a CancellationTokenSource, it'll signal to cancel, set it to null, and return from the event handler.

So now that we have the CancellationToken passed into our SearchForStocks, what do you reckon is going to happen when we kind of double-click Search here.

In fact, nothing happens.

It doesn't matter if we click Cancel one, or two, or ten times, nothing happened.

It loaded all the stocks, you populated our entire data grid with all the stocks that we were loading.

The problem is how would our code block here know where and when to cancel and what to do if you requested a cancelation.

So your code won't just magically be canceled because you pass the CancellationToken and signaled a cancelation.

You need to handle the cancelation as well.

So the reason that we are loading one line at a time is because then if we have a cancelation requested, we could just return the amount of lines that you've already loaded, and we can gracefully handle this cancelation without just tearing down the application.

So in the loop here where we load all the lines asynchronous from our file, we could say if the cancelation is requested, we want to do something about that.

One option is to say that we want to throw an exception if there is a cancelation requested.

This will throw one OperationCanceledException, and then of course, that'll be set on the Task, you can handle that properly inside your continuations.

But to make this a little bit better, we're going to check if the cancelation is requested and then just return the amount of lines that you've that you've loaded.

So now what happened was that when we clicked Cancel, we can see at the bottom that it only loaded about a little over 100, 000 rows, and then it just populated our grid here with a few of them.

We know that we have more stocks because this data grid here is normally filled with a lot more data.

We requested a cancelation, but it only canceled the operation of loading the files from disk.

Remember that we have another expensive operation, which processes all of these different rows, so we pretty much want to cancel that as well.

So we pass the CancellationToken into SearchForStocks, which we then set on the Task, which did nothing, so you might be asking yourself, what's the deal with the parameter where you set the CancellationToken on the Task when it's not doing anything.

The parameter that allows us to specify the CancellationToken on the Task or the continuation is just making sure that it's not running that if the cancelation has already been requested.

So in this case here, we can pass the CancellationToken to our continuation.

And when loadLinesTask completes, it'll only run the continuation if the cancelation has not been requested.

So we pass the CancellationToken into our loadLinesTask continuation as well.

And as you see here, this just immediately canceled our ongoing asynchronous operations.

So this here allowed us to cancel the ongoing operation that's loading all of the file from disk, as well as canceling our continuation.

Now what's interesting here is that this continuation here will execute every time when there is not a cancellation.

So earlier, we changed this to only execute when it was completed, so let's change it back to only run when it's completed, as well as not canceled.

As we saw earlier, we need to specify the TaskContinuationOptions.

Although with this overload here where we pass the CancellationToken, as well as the TaskContinuationOptions, we also need to pass one more parameter, and that's just specifying the Task Scheduler.

So we can simply TaskScheduler.Current here, and this will use the Task Scheduler that's associated with the current context.

This here will now only run the continuation as long as there was not an exception in our loadLinesTask, as well as if it was not canceled.

Finally, there is one more thing I want to add.

In some situations, you might want to say, well, I want to subscribe for whenever someone cancels my token.

I don't want to introduce a specific continuation for that.

I simply want to indicate on my CancellationToken that let me know when there is a cancelation.

The CancellationToken now allows us to register delates that will be called when the CancellationToken is canceled.

This here will be executed in our context, so we can simply invoke the UI from this.

So in this action here, let's just update the UI to say that the cancelation was requested.

So you see here that it now updated our Notes to tell us that the cancelation was requested.

So we saw here how easy it is for us to introduce this CancellationToken by using the CancellationTokenSource, which we can then request to cancel.

We also saw how we can make sure that our continuations or other Tasks are not executed by passing a CancellationToken.

We also get an understanding of the fact that we need to handle the cancelations gracefully and that it's not handled automatically.

We can of course use the CancellationToken with things like the HttpClient and a lot of other asynchronous libraries out there.

So what we simply do here is that we pass the CancellationToken into our GetAsync of the HttpClient.

The HttpClient will then listen for this and throw an exception if the cancelation was requested.

So in our Search_Click event handler, we now leverage the async and await keyword.

We are using our asynchronous StockService to pass to pass the cancellation token that we have available here.

It's pretty much the same pattern that we've just looked at.

It allows us to cancel the ongoing operation, but the behavior of the application is a little bit different.

You'll notice that the Notes will be populated with A task was canceled.

We no longer get information about the amount of data that we loaded.

So depending on which library you use, this might work a little bit different.

Sometimes it might return partial data, sometimes it throws an exception to allow you to know that the task was canceled, and we saw how easy it is for us to introduce the CancellationToken no matter if you're using Task.Run to create your own asynchronous work or use it with things like HttpClient.

Again, this changes the application to the better for your users.

#### Knowing When All or Any Task Completes

I now want to make my users capable of searching for multiple tickers at the same time.

This means that I want to be able to call services.GetStockPrices for multiple times depending on which stocks we search for.

So first of all, let's get a list of all the tickers that we are searching for.

Let's just assume that you could either use a comma or a space to search for multiple different tickers, and then for each ticker that we have, we want to search for these using our service.

So now we are kind of facing a problem.

What I want to say is that we don't want to proceed setting the ItemSource until all the data is loaded from our service.

So the way that we are going to do this is by loading all of these different tickers in parallel and then wait for all of these asynchronous operations to complete.

So we'll need to keep track of all the asynchronous operations.

So this here will now hold a list of tasks that will in its turn when they are done return an IEnumerable of StockPrice.

And then instead of awaiting the result down here, because what this is going to do is that this is going to load one stock at a time, and we want to invoke all of these pretty much at the same time.

So what we'll do instead is we will just capture the task that is a reference to the ongoing asynchronous operation.

So now what we have here is a list of ongoing operations.

So if we search for 10 different tickers, this will create 10 different tasks pretty much at the same time and invoke our API asynchronous, but now we have another problem.

How do we make sure that all of these are completed before we proceed setting our ItemSource? Fortunately for us, there is help to do this.

On the Task object, we can use something called WhenAll or WhenAny.

WhenAll will allow us to pass an IEnumerable of Task.

This here will allow us to say, let us know when all of these tasks are done.

We could also say that let me know when any of these are done.

I want to know which one is fastest.

But we'll get into that in just a little moment.

For now, we're going to use Task.WhenAll.

And of course, Task.WhenAll is an asynchronous operation.

So do you know what we can do now? We can introduce the await keyword.

Task.WhenAll will in fact return a list of all the results that we got from asynchronous operations.

And since our result is an IEnumerable of StockPrice, we will get an array of IEnumerable of StockPrice.

And in order for us to concatenate all of these different lists, we can use SelectMany.

So we'll simply do allStocks LoadingTasks .SelectMany, and this here will take all the different lists and put them into one big list of stock prices.

So you'll notice here that we can search for both Microsoft and Google by just separating these by space.

And then as we scroll down in our list here, you can see that we got stock prices for both Google and Microsoft.

So this here shows you how you can start a lot of different asynchronous operations, use Task.WhenAll to make sure that you don't proceed in your method until all of those different operations are completed.

Now what I want to do is I want to make sure that our operation here completes within a given time, and I can do that by combining a few different things.

I'm going to introduce a Task.Delay, which will allow us to get a notification when that particular time has passed.

So the idea here is that if it takes longer than 2 seconds, we're going to cancel all the ongoing operations.

So you're probably wondering how to do that.

Well first, let's grab the Task.WhenAll Task in a separate Task as well and then ask whichever of these two completed first.

Now we can use Task.WhenAny to get a notification when one of these two were completed.

So you'll notice here that Task.WhenAny returns a Task of Task.

This means that what happens is that it'll actually return the Task that just completed.

So what we can do is we can await this to make sure that we don't proceed setting our item source.

Because we are using the await keyword with Task.WhenAny, we'll get the particular Task that just completed.

Task.WhenAny will make sure that we get a Task back when one of these in the collection of Tasks that we're passing to Task.WhenAny completes.

So in case this was the timeoutTask, what we are going to do is that we are going to make sure that we cancel all the ongoing operations that the Cancellation token is being passed to, we're going to reset the CancellationTokenSource, and then I'm going to throw an exception just to make sure that the flow of the application works properly.

So now that we searched for Microsoft and Google, you can see at the bottom that it told us that it completed in about 2 seconds, so it's not exactly processing this in 2 seconds, but it's close enough.

And then we can see in the Notes section that we got a Cancellation requested and that we got a Timeout.

And of course, if we search for this again when we know that the service has loaded all of this into memory and it's super quick to search for all the stocks, it'll just take a few hundred milliseconds to execute the code, which means that loading all the stocks was a lot faster than the timeoutTask.

So this here illustrates that we can initiate a lot of asynchronous operations that run in Parallel, which we can then await as a chunk of operations that all need to complete before we proceed.

We can also then indicate that we want to wait for one of them to finish and get a notification about which one that actually finished.

This gives us a lot of flexibility when building our applications, although we could actually use the CancellationTokenSource to introduce a cancelation to always cancel this after a given delay, but the code that we have here illustrates that we can do this in multiple different ways.

And this here uses the async and await keywords together with Task.WhenAll and Task.WhenAny to show that we can build really flexible applications.

#### Precomputed Results of a Task

So you know we've been running this locally and hitting our own API.

Sometimes you end up in situations where querying the API actually costs money, and sometimes you want to write tests for your API.

In those situations, use in mocked or faked classes.

And in order for us to speed up the development process of this application, we want to change our StockService to a mock StockService, and the way we want to do this is by implementing the interface IStockService, which both our StockService is doing, as well as this class called MockStockService.

Now our MockStockService will simply return some template data that we'll use in our tests and just to make it easier for us to run the application.

The signature though for this is that it needs to return a Task of IEnumerable containing StockPrices.

But since we are creating everything here in an in-memory list of StockPrices, there is no real reason for us to introduce a Task or the async and await keywords.

So in situations like this, it's very common that we want to return this object wrapped in something that looks like a Task.

Fortunately for us, there are multiple different ways for us to mimic the behavior of a Task.

For instance, we can return a Task that's already marked as completed.

You normally do this when you override things that requires you to return a Task, but you don't really do any asynchronous operations, so you don't really care about creating the Task.

There are also multiple other ways for us to create containers containing specific situations for different Tasks, and one of these in particular stand out to us.

Since we want to return this list of StockPrices just wrapped in a task without actually introducing the async or await keywords, which in itself introduces things like a stateMachine, which just adds a lot of overhead if we don't need that.

So we can simply use Task.FromResult, and this here creates a task that completed successfully with a specific result.

So let's just pass the Result in here.

So we'll just return all the stocks where we can find the particular ticker.

Now this here mocked our entire service.

It allows us to represent a Task that executed without even in fact running anything asynchronous.

So now when we consume this mocked service, the interface is identical and we can use the async and await keywords, and we can use the continuations.

So now when we search for Microsoft in the application, you can see here that we have our mocked data, and it only took 3 ms so we can be certain that these ran against our mocked service.

So this is a great addition and a great way for us to work with our asynchronous libraries in testing or in situations where we don't really want to introduce any asynchronous principles.

#### Process Tasks as They Complete

We've got the capabilities of searching for multiple different stocks at once, but let's say that we want to display the stocks for each company as they are returned to us from our API.

because we are already querying the API for each different ticker that we are searching for, and we are doing that simultaneously.

There are in fact just a few changes that we need to make to the code to make sure that the data grid in the application is updated as our stocks are loaded into the application.

So the first thing that we'll need to add is a collection where we can dump all the data that we're getting back from the API.

We'll use something called the ConcurrentBag.

This is a thread-safe collection, which allows us to add values for multiple different threads without having to worry about data being lost on the way.

If you were to use a List of StockPrice, that's not thread safe, so you could end up losing data when you add that to the collection.

Next up, what we'll do is that we'll go down to our loadTask, and we'll chain on a continuation.

So this here will chain on a continuation to each service call that we are doing to the StockService.

Inside the continuation, what we'll need to do is that we need to add all the data from this particular result to our bag of data.

Just to make it a little bit easier for us, let's just pick the first five results inside this collection of data.

The data we're getting back here isn't IEnumerable StockPrices.

So we can simply say that from the Task Result, we'll just take 5 StockPrices, and then we'll add this to our ConcurrentBag.

So that's great.

So for each company's stock that we get back from the StockService, we'll add 5 of the stocks to our bag of StockPrices.

Now what we need to do is to update the UI.

You see here at the bottom, we still set our Stocks.ItemSource.

Now we don't want to do that down here at the bottom.

We want to do this inside the continuation.

And to invoke the UI, do remember that we need to use the dispatcher or equivalent in whichever UI framework that you work in.

Just to make it easy on us, I will just make a copy of the ConcurrentBag and set the ItemSource to that.

You'll see here at the bottom that it's complaining that we cannot add the loadTask to our tickerLoadingTasks collection.

That's because the loadTask is no longer a Task of IEnumerable of StockPrice.

LoadTask is now simply a Task because we are getting the Task for the continuation.

If we want to keep the signature as a Task of IEnumerable of StockPrice, we could simply return a value from our continuation.

So now the code further on still works in the application.

So just to make sure that this doesn't timeout after 2 seconds, because loading a lot of stocks will take a little bit of time, we can go down where we handle our timeout, and we can simply comment this out and make sure that before we proceed the execution of this method, we just await the allStocksLoadingTask, which is a simple reference to our Task.WhenAll.

So now as we search for a few different tickers, we can search for Microsoft, Google, and a few more that I know exist in our collection of stock prices.

You'll see that it adds Microsoft, Google, and all the other stocks are populated as it gets back from our service.

We can see at the bottom that it's loading all of these different stocks, and as we got the data back from our API, we added it to our application.

This here shows you the power of chaining a continuation onto multiple different Tasks.

This allows us to handle the result as it gets back to our application.

#### Controlling the Continuations Execution Context

In some situations, we really don't care about coming back to the original context when we are running the code in our continuations.

Marshaling back to the original context can in some situations be rather expensive.

In those situations, wouldn't be very handy for us to be able to configure the awaiter to let the await keyword know that it doesn't have to marshal back to the original context? And of course, there is a way for us to do that.

We can use a method called ConfigureAwait to let the awaiter know if we really want to come back to the captured context.

So given this code here, what happens in our GetStockFor is that we're doing an asynchronous call, and then we update our UI.

because in the continuation, we're back to the original context.

And the original context is, of course, the UI thread.

Because when we initiate this call here, we are doing that from our Click event handler, and the call to that, of course, originates from the UI thread.

So what do you reckon happens if we configure the awaiter to indicate to the await keyword that we don't care about coming back to the original context? ConfigureAwait allows us to specify if we want to continue on the captured context.

And of course, this defaults to true, which allows us to execute the continuation on the captured context.

So what do you reckon happens if we change the continuation to not execute on our captured context? If you guessed that we would have a problem because we are doing cross threading, you guessed right.

Because what happens here is that when we try to update the Notes, we're no longer on the original context, which means that we're no longer on the UI thread.

So that's rather interesting.

So of course, this here has an impact on what happens further along inside the continuation of that particular method.

But what happens if we move the UI interaction to the Click event handler after we are back from the GetStockFor call? What's really interesting here is that it actually worked.

So this here indicates that using ConfigureAwait only affects the continuation in the current method that you're operating in.

So of course, when we're inside our Search_Click event handler, we are in a different asynchronous context.

So of course, if we configure the awaiter to not go back in the captured context when we are back from the GetStockFor call, we'll have the same problem as we had earlier.

We are now doing a cross-threading call.

ConfigureAwait is really powerful as it allows us to continue executing the code without marshaling back to the original context.

That means that we can have an improvement on the performance of the application as it doesn't have to wait for the particular context, in this case, the UI thread, to continue executing the continuation.

Now this also means that there shouldn't be any code in your continuation that will need to leverage things like operating on our UI.

And of course, you can do this same thing in ASP.NET.

In previous versions of ASP.NET, pretty much everyone was suggested to use ConfigureAwait for their asynchronous operations.

When you apply ConfigureAwait in traditional ASP.NET, it will just continue executing the continuation on the same thread.

This means that it doesn't have to queue the continuation on the thread pool, but it'll just continue executing the continuation on the current thread, and that's of course a lot quicker.

Now one of the famous and common problems in ASP.NET when working with async and await and introducing ConfigureAwait is working with things like the HttpContext.

You'll notice here that we have our System.Web .HttpContext.

Now of course, we would probably be better off using the property HttpContext in our controller because that will fix a lot of things for us, but this here illustrates a problem.

If we step through the code and go into GetStocks, you'll notice here that when we were calling LoadStocks in our DataStore, we were also configuring the awaiter to say that we don't care about coming back to the original context.

This means that the code on the next line, which is then trying to get the HttpContext, is going to execute on the same thread that our asynchronous operation was executing on.

And what you notice here is that we no longer have the HttpContext.

Our HttpContext is now set to null, and that's only because we introduced ConfigureAwait false because the traditional System.Web .HttpContext .Current didn't flow across to the continuation if you set ConfigureAwait to false.

If you really want to use the HttpContext, you are better off getting it from the application instance.

This here will not return null in the continuation if you set ConfigureAwait to false.

So keep in mind here, what happens is that when we do our asynchronous operation, of course that spawns off a new Task, and that spawns off a new thread, and that thread will then be in charge of executing our continuation if we've specified ConfigureAwait false, but the same goes for ASP.NET.

ConfigureAwait only affects our current method.

So you'll notice here that we have our HttpContext, and then of course, we also have the HttpContext.Current even though we have ConfigureAwait false in one of the methods that we are calling.

So again, that just illustrates that ConfigureAwait only affects the particular method that you're using it in.

Although if you're working in ASP.NET Core, using ConfigureAwait is totally useless because there's no such thing as going back to the captured context.

ASP.NET Core no longer has what's called asynchronization context, so ConfigureAwait doesn't have an affect at all in ASP.NET Core.

So we can completely get rid of that if we were using that inside our controllers.

So with that being said, when is it appropriate to use ConfigureAwait false? Whenever you're building libraries, if you're a library developer, you don't know if the people that are using your library will be building WPF, WinForms, ASP.NET 4.5, or ASP.NET Core, or Xamarin, or any other type of .NET application, so use ConfigureAwait false when you don't care about coming back to the original context.

Using that inside your libraries will work the best across all the different types of .NET applications.

Because let's face it, if you're building a library that exposes asynchronous methods, those probably shouldn't try and force themselves back to the original context.

So in ASP.NET, really be careful about when you're using ConfigureAwait false because you really need to be able to guarantee that you don't need to access things that live on the original context in the continuation.

And in a lot of situations in libraries, you really don't need to do that, so libraries should always include ConfigureAwait false for their awaiters because that way the code inside your libraries, they will work as fast as possible without having to switch between threads.

#### Key Takeaways

This module has been packed with information about how you can approach your asynchronous principles, in particular when using the Task Parallel Library, as well as combining this with the async and await keywords.

One of the most important takeaways from this module is to remember that the continuations are executed on a different thread.

This means that when you compare the continuations using ContinueWith on your Task to the way that we did it using the async and away keywords, the continuations are executed vastly different, which means that if you invoke your UI formula or continuation, you need ways to cross communicate over the different threads otherwise you'll end up having issues and getting exceptions, and that's not really what we want.

We've seen how easy it is for us to work with the Task and introduce that in our applications.

The Task is a simple reference to asynchronous operation.

We can wrap pretty much anything in a Task.Run.

The work passed to Task.Run is scheduled to execute on a different thread.

This means that we can take pretty much any code piece that we have in our code and we'll be insured that this going to be executed on a totally different context.

Now of course, do remember that the code that you might wrap in your Task.Run could, of course, leverage things like the dispatcher to communicate back to the UI.

This could be a potential problem.

So just make sure that the code that you pass into a Task.Run doesn't in fact block your applications.

And just as we've seen multiple times throughout this course, Tasks swallow exceptions.

But we found out that it is really easy for us to get notifications whenever there is an exception.

We can tell the continuations to execute only when it succeeded, if there is a failure, or if it's been canceled.

This means that we can make sure that we validate the success of our tasks and notify the user accordingly.

And do remember that when we chain a continuation onto our Task, this will be executed on a different thread.

And it's important to remember that wrapping code in Task.Run can be dangerous.

There is no guarantee that if you simply wrap a method call in a Task.Run that it doesn't contain any blocking code.

So a very common pattern is if you have two alternatives where one method is asynchronous and the other one is synchronous, just make sure that you don't simply wrap the synchronous method call in your asynchronous method.

Just copy the code over to your asynchronous method and make sure that all the code inside your new asynchronous method is in fact not blocking your application.

So to summarize everything that we've talked about in this module.

We talked about introducing the Task in the application.

We saw how we can wrap synchronous code in a Task and offload the work from the UI thread to run that somewhere else.

We saw how we can get the result or the exception from the Task by introducing a continuation.

Now of course, we can indicate to the continuation if it should be executed only with the Task ran to completion or if there was an exception, and we saw how we can build really flexible applications by shooting off a lot of asynchronous operations and wait for all of them to complete or simply wait for any of the operations to complete, and then we get a notification back so we can handle the potential result.

Last but not least, we've talked a lot about the differences between ContinueWith and using the await keyword.

We've seen how we can combine the principles of using the async and await keywords together with things like the Task Parallel Library where we introduce our own asynchronous operations.

And this, of course, led us into talking about the differences between ContinueWith and the await keyword and the fact that ContinueWith will execute the continuation on a different context.

So now you know how to build really powerful applications that are no longer blocking the UI thread.

You can now leverage the asynchronous principles by introducing a Task for things that doesn't already expose asynchronous operations, and you couple this with the async and await keywords, and you have really powerful applications that give your users a really great experience.

Next up in the course, we'll talk about how to build even faster applications by applying parallel principles.

We'll talk a little bit more about the difference between asynchronous and parallel programming and how it affects our applications when we introduce things like the Parallel Extensions.

So let's jump onto the next module and talk about parallel programming in .NET.

### Parallel Programming Using the Parallel Extensions

#### Introducing Parallel Extensions

Hey, this is Filip Ekberg, and you're watching Getting Stared With Asynchronous Programming in .NET.

In this module, we'll be talking about parallel programming using the Parallel Extensions.

This will set you off to build really powerful and fast applications.

We'll learn all about the differences between using the Task Parallel Library, as well as the Parallel Extensions.

Essentially, parallel programming allows you to break down a problem, be it large or small, and compute each part independently.

So imagine you have a large list of customers, and you need to perform some calculations on each different customer.

So in our application, we could use the loadedStocks and perform computations on each different company's stocks in parallel.

Since Microsoft, Google, and whichever tickers that we're loading is totally independent from the other ones, we can perform computations of those chunks of stock prices.

And of course, if you really want to, you could aggregate the result of all those computations.

And of course, these computations are probably CPU bound, and that's the perfect fit for parallel programming.

When we find these types of problems where we have independent chunks of data, we can apply these parallel principles and solve the problems in parallel.

Parallel programming in .NET can take many forms.

We can, for instance, use threads, the Task Parallel Library, Parallel Extensions, or Parallel LINQ.

Now all of these different tools kind of builds on the same principles, and as we previously looked at the Task Parallel Library, we are now going to look at the Parallel Extensions.

So the first thing we want to do in the application is that we want to perform some computation in parallel.

Now what's interesting here is that the Task Parallel Library is in fact something that allows us to run operations in parallel.

Now the biggest difference between parallel and asynchronous programming is that in asynchronous programming, we can schedule a continuation.

And as mentioned, in this module, we'll be looking at the Parallel Extensions.

Now the Parallel Extensions live side by side with our Tasks, and the reason for that is because the Parallel Extensions internally leverage the Task Parallel Library.

That means that if you use the Parallel Extensions, it'll use the Tasks internally.

So you're probably wondering, why are we talking about the Parallel Extensions? Well, given the fact that everyone's computer is different, you don't know how many cores you have in the computer that will execute your applications.

The Parallel Extensions will take care of calculating the most efficient way of dividing our tasks among the different cores that you have available by distributing that efficiently across the different cores that you have available on your system.

So of course, we could introduce a for loop that just creates a ton of tasks for us, but the problem here is that this is going to be pretty inefficient.

So instead of doing that, we can leverage things like the Parallel for loop, which allows us to do exactly the same thing as a normal for loop does, but will make sure that if we have a lot of data, it may run in parallel.

Notice that it doesn't guarantee that it runs in parallel because it really depends on the system.

And then, of course, we have the capability of running a for each loop as well, and then we have one more thing that allows us to invoke actions, possibly in parallel.

So the Parallel Extensions does a lot of heavy lifting for us.

Now there is another big difference between using the Parallel Extensions and the Task Parallel Library, and that's mainly what happens when we call each of these different operations.

But let's get back to that in just a moment.

Let's use Parallel.Invoke to execute a few different actions.

And I had a look at the internals, and depending on how many actions you passed to Parallel.Invoke, it might execute them using a normal Parallel.For loop.

So there's a lot of clever things happening internally.

So let's just make sure that the loadedStocks includes a flat list of all our stocks, and then we can start passing the actions to Parallel.Invoke.

Let's say that we want to execute four operations in parallel.

Each of these actions will just add something to our debugger so that we can track what's happening, and then it's calling some expensive computation based on our loadedStocks.

Exactly what's going on inside CalculateExpensiveComputation doesn't really matter.

Let's just say that it's a pretty expensive computation, so it's ideal for us to utilize all our cores on our computers.

We now have four actions that each need to compute some expensive computation, and we're asking the Parallel Extensions to please do this in parallel.

It'll make sure that we have the capability of running things in parallel.

It'll create all the tasks that it needs to do this and make sure that it's efficient.

You'll see that it starts off the operation 1, then 4, then 2, then 3, and it locked up the UI.

So that's a little bit interesting.

And now we also see that it completed all of the different operations, so they didn't start off in order, nor did they complete in order.

So that's the whole point of this.

We're introducing all of these different chunks of data that can be processed in parallel, and we don't care about the order.

but one of the interesting things here is that it locked up the UI.

So calling anything on the Parallel Extensions is in fact a blocking operation.

This will in fact block the calling thread until the operations are all completed.

And of course, if we want to solve that, we could wrap it in a Task.Run, but that's something you can play around with yourself.

So no matter if we were using Parallel.Invoke, Parallel.For, Parallel.ForEach, they all help us distribute the workload in a very smart way across our different cores on our computer, and it's also a lot more effective.

Because this here locks up our calling thread, it's really important that the actions that we execute in the parallel execution don't try to call back to that thread.

So if we use the Dispatcher.Invoke here, we'll get a deadlock because what's happening here is that the Parallel.Invoke method is locking up the UI thread until it's completed, and for this action to complete, it needs to call the UI thread hence we get a deadlock.

And that just something to keep in mind.

We can also pass something called the parallelOptions.

This is true for Parallel.Invoke, Parallel.For, and Parallel.ForEach.

Passing the parallel options allows us to do things like passing a CancellationToken, which means that the Parallel Extensions can be canceled, because remember, they're all using the Tasks internally.

And then we can set something called the DegreeOfParallelism.

This here allows us to change the maximum amount of concurrent tasks.

So since we saw that we had four operations starting off at the same time, what happens if we change this to 2? So I've got 12 cores in my machine, so it can handle a lot of work, but I still don't want to hog up all the resources.

So we saw here that it started off the first and second operation, and then as the second operation completed, it immediately started a third operation.

And then only when the first operation completed, it could start the final one, and then we can see the two final ones being completed at the bottom.

So we saw that Parallel.Invoke is really powerful.

It allows us to execute parallel operations.

We can configure exactly how many tasks that we want to concurrently run, but in most cases, you want to keep this to the default.

Now of course, since this here builds on top of the Task Parallel Library, of course you can use this in ASP.NET, console applications, Xamarin, WinForms, or any type of .NET applications.

Keep in mind though that if you misuse the parallel principles in ASP.NET, that can cause some really bad performance for all of your users.

Just imagine if you have an invocation from the user.

One of your actions is now running a parallel process that utilizes all the cores on your server.

What happens when all the other users wants to use your system? So just keep that in mind.

If you really want to do heavy computation your server side based on the invocation of users, there are multiple different architectural decisions that you can make in your applications, but that's totally out of the scope of this course.

So just very easily, we saw that we can introduce a parallel invocation in our application, and it's executing all these as effectively as possible based on your system.

So the Parallel Extensions makes it a whole lot easier for us to build really powerful and fast operations.

#### Processing a Collection of Data in Parallel

We saw how we can use the Parallel.Invoke to run a set of actions.

Now let's say that we have a collection like we have here.

We've got our stocks, and I'm going to process all of these stocks in parallel.

Now as mentioned, we can use the Parallel Extensions to do that.

We have the options of using the parallel for loop or the parallel foreach loop.

So imagine that we need to iterate over all of our stocks.

Here is an example of how we do that prior to utilizing the parallel foreach or parallel for loop.

And in this case here, we expect a list of stock calculations.

These calculations are based on the collections of different stocks that we're getting for each different ticker.

So if we search for Google, we get a stock calculation for Google, as well as one for Microsoft if we search for that one as well, and this is true for all of the different ones that we search for.

And we get the result for this by calling our CalculateExpensiveComputation method.

Again, the implementation detail in this method isn't really important.

Just trust me when I say that this one here is pretty slow.

And as we get the result out of this expensive operation, we create a StockCalculation based on the ticker that we are currently working on, and then we simply add this to our list of stock calculations.

Now don't worry about the fact that this locked up our application.

The point of this isn't to make the UI responsive.

It's to make really fast computations.

So if you look at the bottom, it took about 3 seconds to execute this code.

Now let's convert this into using the Parallel Extensions and see how much faster this code will get.

So in fact, it's really simple for us to convert a foreach loop into a Parallel.ForEach.

You'll see here that the first parameter that we need to set on our ForEach loop is the source, and this in our case is the loadedStocks, the second one is the body, and the body will get a reference to the current collection of stocks.

This is as easy as it gets, although there is one problem.

I've mentioned several times that the List of T is not thread safe, so we want to introduce something else that allows us to increase a collection with items in a thread-safe manner.

So we'll just change that to a ConcurrentBag.

Now once we run the application, you'll see that it's a lot quicker.

In fact, this here is more than twice as fast as the normal version that we had earlier.

And in fact, on my computer, this is not even utilizing all of my different cores.

So as this list grows larger, the difference between the parallel and non-parallel version will be a lot different as this list grows with more items.

So this here shows you how easy it is for you to convert one of your for-each loops into a parallel version of the foreach, and just as with our Parallel.Invoke, we can pass parallel options, we could pass the CancellationToken, we could change the amount of concurrent tasks that we are allowing the Parallel.ForEach to leverage, so this here makes it very flexible.

And with very minimum effort, we made the application a lot faster.

We also saw here how we can aggregate the data that we're computing inside our parallel execution and add this to a thread-safe ConcurrentBag in our application and leverage that after our parallel execution has completed.

Both Parallel.For, as well as Parallel.ForEach both return a ParallelLoopResult.

This here will tell us if the execution completed successfully, so we can check if this completed, which means that the loop ran to completion and that we didn't receive a request to end this prematurely.

We also have something called the LowestBreakIteration, which is more common for the Parallel.For.

This gives you the lowest index of where break was called.

For the Parallel.ForEach, this here will give you an internal index, so that doesn't really tell you anything.

You might also wonder how do we break out of this operation? How do we tell all the consecutive operations to stop executing? Well, there is in fact a way for us to get a second parameter passed to our Parallel.ForEach, and that's the state.

The second parameter passed to our action will allow us to indicate that we want to break.

This means that it only ceases the execution off iterations beyond the current iteration, and it's even telling us that it's doing this at the system's earliest convenience.

We can also call Stop.

If we call Stop, it'll pretty much immediately just cease execution of the parallel loop, again, at the system's earliest convenience.

To illustrate this, let's change the Parallel.ForEach loop and introduce a Break or a Stop.

We'll start off by setting the ParallelOptions and the MaxDegreeOfParallelism to 2 because otherwise what will happen is that since I have so many cores on my machine here, I'll just start off all the parallel iterations.

So now we search for the Microsoft ticker.

When we find the Microsoft ticker, we want to break out of the Parallel.ForEach loop.

This will cease the execution of iterations that have not yet been executed.

It will not stop any ongoing parallel iterations.

Also notice that this doesn't automatically exit our current context with a return from the context to ensure that we don't calculate our expensive computation.

If we have a look at our Output window, we can see that it started off processing two of our tickers, and then of course, it immediately found that we were looking for Microsoft, and it's breaking out of the context.

But as you also see, it completes the processing of the other ticker.

And if we add the Microsoft ticker a little later in our search, you'll notice that it started off processing two different tickers, and then when it gets to Microsoft, it'll indicate that it should no longer process any more iterations.

Pretty much the only difference between using Break and Stop is that inside our current parallel iteration, we can check if the operation has been requested to be stopped.

In this case, it started processing three of the tickers before it got to Microsoft.

But then, of course, as got to the Microsoft ticker, it indicates that we need to stop.

And if there are any current ongoing iterations, they could, of course, themselves check if there has been a Stop requests.

You'll also notice that we don't get the LowestBreakIteration where we're using Stop.

But again, that's mostly just important if we're using Parallel.For.

So not only is this very powerful, it's also very flexible, and it's built on top of the Task Parallel Library, which we've seen is extremely powerful to allow us to do simultaneous processing.

So all of this illustrated how easy it is for us to introduce a parallel iteration in our application to process a lot of data and speed up the computations that we have in our applications.

#### Working with Shared Variables and Collections

We've already mentioned a fair few times now that you should use thread-safe collections when you aggregate data in your application where the data comes from different asynchronous or parallel operations.

Now in some situations, you might perform calculations in parallel.

So let's have a look at what happens when you try to introduce shared variables that are all going to be updated from your different parallel or asynchronous operations.

So in this situation here, we have our loadedStocks.

so we've got this flattened array with all the different stocks in one large enumerable.

We convert that to an array, and now we want to process this to compute some value, and of course, we want to use the Parallel Extensions to perform the computation.

We'll use Parallel.For.

The first parameter is where we want to start off.

We'll start off from 0 until we don't have any more stocks to process.

And notice that it says toExclusive, so we don't have to do Length -1 like we normally do in the for loops, and then we have the body.

Now simply enough, I'm going to compute some value, and we'll just increase the total in the application with this particular value.

We've got the method call Compute.

It runs some computation on the particular stock, which takes a little bit of time.

It's not really important, but it's an expensive operation, and we want to do it in parallel for all the different stocks.

So this here performs the computation on our loadedStocks, and then we increase our decimal with the number that we're getting back from our Compute method, and then we populate the Notes with that particular value.

Notice though that as we click Search, the value that we get in Notes changes.

That's a little bit odd.

In fact, it's not weird at all.

Because what we're doing here is we're changing the value of total for multiple different places at the same time.

This here will give us a rather random experience.

So how do we solve this? Well, we can use something that allows us to increase the value in a thread-safe manner.

Well, in order for us to change the value of a decimal, we cannot use any atomic operations.

If we were, for instance, to work with integers, we could use atomic operations through the Interlocked class.

This would allow us to add two different values together where both of them are 32-bit integers.

So just to illustrate how this would work if it's an integer, let's change the type from decimal.

We'll pass a reference to the value that we want to increase, and then we'll pass the value that we want to add to this particular location, although Compute here returns a decimal.

So now we're simply casting the result from Compute to an integer.

Now you notice that the result is a lot better.

Personally though, I don't particularly like that I have to cast this to an integer.

So is there another way for us to do this? We'd have to introduce something that ensures that we're the only ones currently updating the object.

So we can introduce a static object in our class that we can use as a lock.

Think of this as locking the door when we are performing the add operation to our particular decimal.

So we'll introduce this object outside of the method.

This here is a static object.

It's very commonly referred to as the syncRoot.

So let's introduce a lock that allows us to in a safely manner update our total variable.

So now what's happening is that we're locking the door.

We're saying that we want to lock syncRoot so we can be the only ones that currently work with this object, meaning that whenever someone else tries to lock this, they have to wait for us to unlock the door.

That means that all the code inside this code block here can safely update total, but we don't want to run the computation in here because that means that we're going to have the door locked when we don't really need to.

So we'll perform the computation outside of our locked door, and then after we've got the value, we'll update the total inside our locked door in a safe manner.

This here allows us to update total without locking the syncRoot for too long.

Notice that we get the same value every time, and we now get the full number.

Because when we converted this to an integer previously, we lost a little bit of data.

So there's one thing that I want you to consider.

Imagine that you don't have the flat structure and you want to process each company's stocks in parallel, and then for each company, you want to process each stock.

So what I really want you to think about, is this really the most efficient way to do this? We've got a Parallel.ForEach loop that will run for each company that we're loading, and then we process all the different stocks.

The stock processing is totally fine.

The problem though is that do we really need to update the total for each time that we get a result back from the computation? So we can change this up a little bit to make it a little bit better.

This here is a little bit more efficient.

Now we only lock the syncRoot when we've processed all our stocks.

And this pattern goes for if you're working with the concurrent collections or other thread-safe objects as well.

Try to think about how you can optimize your code to have as little side effects as possible, especially when we introduce parallel and asynchronous patterns.

Also note that you should be very cautious when using the locks in your applications, especially if you're using nested locks, which could end up causing deadlocks if you're not paying attention.

So we saw that it's rather easy for us to interact with shared variables in our parallel executions.

We also saw that there might be side effects if we are not thinking about what we are doing.

So hopefully now you have a better understanding of how to approach parallel programming in your .NET applications, no matter if you're working mobile, desktop, or the web.

#### Summary

This module has been packed with information about parallel programming.

Hopefully now you've got a really good understanding of when it's appropriate for you to use parallel programming in your applications.

This means that understanding the implications of introducing things like the Parallel.For, Parallel.ForEach, or Parallel.Invoke methods, especially when working in things like ASP.NET, it's really important to make the conscious decision that this is something that you want to use in your particular code.

Hopefully by now you've really understood the difference and the similarities between parallel and asynchronous programming.

The big difference is that in asynchronous programming, you can schedule continuations to handle the result of your concurrent operation.

And a fun fact is that the Parallel Extensions that we've been using in this course are built on top of the Task Parallel Library, so you can use the Task Parallel Library to introduce both the asynchronous and the parallel principles in your applications.

And do remember that all of these different principles work in any type of .NET application.

Of course, if you're working on a microprocessor running .NET that only has one core, maybe that doesn't leverage the power of asynchronous and parallel programming.

We of course looked at how we can introduce parallelism in our applications.

We did this by introducing the Parallel Extensions, which is a really efficient way for us to break up our larger problems and solve them in smaller independent pieces.

This saves us from managing our tasks and threads and computing how many cores we have ourselves.

The Parallel Extensions does all this for us and it distributes the workload on our computer in the most efficient manner.

We also saw how we can configure the execution.

This means that we could change the max amount of concurrent tasks that we're allowed in the application, and this is really handy if you don't want your application eating up all your resources.

And of course, we also saw how we can aggregate results in our parallel operations.

And with that, we also talked about how to avoid potential side effects, especially when using shared variables.

If we're using classes like List of T, we can easily change all of those to the ConcurrentBag of T.

This will allow us to work with the collections in a thread-safe manner.

And remember, whenever using the lock, think of that as locking your door, and you're the only with the key that can currently work on that particular code.

So if you have multiple different parallel operations that want to open this door, maybe you should unlock it a bit earlier.

So don't put too much in heavy operations inside your locks.

So again, this module was packed with information about how to approach parallel programming in .NET.

We've got a lot of good information about how to speed up the execution of potentially expensive operations.

We saw how we can take a big chunk of data, split that up into smaller pieces and sole computations concurrently.

And of course, we also saw that the Parallel Extensions will block the execution until it's completed.

So you could of course wrap that in a Task.Run, which you learned in the previous module.

Next up, we're going to deep dive into asynchronous programming, and you will learn everything that you need to know in order for you to completely understand how the async and await keywords affect your application.

So let's jump right into the next module and dive deep into learning more about asynchronous programming in .NET.

### Asynchronous Programming Deep Dive

#### Advanced Topics

Hey, this is Filip Ekberg, and you're watching Getting Started with Asynchronous programming in .NET.

We are now going to take an asynchronous programming deep dive.

And congratulations on making it this far in the course.

This module is where it's going to get very interesting.

I really encourage you to stick around until the end.

We'll be going through a lot of things that will make you a lot better at approaching asynchronous programming in your applications.

We're not only going to cover things like the state machine and what happens when we apply the async and await keywords, but we're also going to talk about things like reporting the progress of a task using the Task Completion Source, working with child and parent tasks, and asynchronous streams.

So there's a lot in this module that is going to make you a much better developer when it comes to applying the asynchronous principles in your applications.

So let's just jump right into talking more about the advanced topics of asynchronous programming.

First of all, I want to challenge you to think about these two different methods.

Now the signature for the method read file similar in both cases.

There is no difference to the caller that's using these two methods, although there is a really big difference in what happens in these two different cases.

In the first case of introducing the async and await keywords, we introduce a state machine.

And in the second example, we don't introduce a state machine, we simply return a reference to the asynchronous operation that's reading a file from our disk.

So in reality, what's the big difference between these two use cases? Well, one of them is adding a lot of overhead by introducing what's called the state machine.

And in this module, we'll definitely look into the impact of introducing a state machine.

But something to keep in mind when we look at these two examples is that there is no reason for us to introduce async and await in this scenario because we're not doing anything in particular in the continuation.

Although if you do end up not introducing the async and await keywords in this scenario, keep in mind that someone along the way will need to await your task otherwise you might run into other different problems in the future.

So introducing the async and await keywords in this scenario would mean that you find potential problems and that you ensure that the operation is awaited properly.

So keep that mind for now, and we'll be talking more about optimizing your code and building really powerful asynchronous applications throughout this module.

#### Report on the Progress of a Task

You know the progress bar that we have in our application.

Wouldn't it be great if we could update that based on the current status of our asynchronous operation? Now I'm sorry to say, but the Task in the Task Parallel Library doesn't support reporting on the progress, so we need to build something yourself to report the progress of your task.

Because thinking about this problem, how would the framework know the progress of your Task? It would have to look at certain things inside the asynchronous operation, like how much of the file have we loaded from disk or how much data have we currently processed? All of those different things mean that we need to introduce our own computations to solve that, although, of course, there's a way for us to report on the progress otherwise we wouldn't be here.

In our WPF application, we're using a progress bar.

If you're working in other types of applications, you might have similar controls available.

Now what we're initially doing when we're clicking Search is that we were setting our progress bar to some initial values.

We'll set the value to 0, which means we currently have no progress, and then we'll set the maximum amount of progress to the amount of tickers that we're currently going to load.

So this probably gives you an indication that what we were going to do here is that we're going to update our progress bar as we are completing loading all the stock prices for each ticker.

This means that if we are loading five tickers, we'll update our progress bar five times.

It's as simple as that.

And in order for us to report progress, we'll introduce something called Progress of T.

Now Progress of T provides us with the implementation for the interface IProgress of T that allows us to retrieve a callback when we are supposed to update our progress.

So what we can specify here is that whenever there is an update in Progress, we can also retrieve some data into the current Progress.

So in our case, that could be the entire IEnumerable of our StockPrices.

So when we're setting up this class Progress, it's going to capture our SynchronizationContext.

Using the SynchronizationContext is the same thing that we use when we're using the dispatcher or what the awaiter is using with communicating back to the original context.

So the original context is really just accessed using this SynchronizationContext.

And our Progress class here will capture the SynchronizationContext.

So whenever we report the progress, we know that we are back to the calling context, which in our case, is the UI thread.

Now you'll see here that we have an event called ProgressChanged.

This is raised for each time that we increase our progress value.

We can use this in order for us to capture whenever the progress is changed, and this is simply an event handler, and the first parameter is just the center, and I'm not really going to care about that.

The second parameter though is going to be our stocks.

Now inside our event handler here, we can interact with our UI.

We could, for instance, say we're going to update our valley of our progress bar.

And then to make this a little bit more interesting, I'm going to add some notes in the application to indicate which stock just loaded and how many stock prices that we got for this particular ticker.

So this here will now increase our progress bar and then update the Notes to tell us which ticker it currently completed, and as well the amount of stock prices that we just loaded.

Now we need a way for us to report that the progress changed, and the best practice when working with the IProgress is to pass the reference into the asynchronous method that will indicate a ProgressChange.

So we'll pass the Progress into our loadStocks.

This of course means that we now need to change our signature of loadStocks as well.

We're going to work with the IProgress of T, and in our case, the T is an IEnumerable of StockPrice.

Now what we want to do here is that each time that we've got some data back from our server, we want to update the progress in our application.

So the best way to do that is to chain on a continuation to the call that we're doing to get StockPrices for.

And let's just make sure that we don't break anything in the application, so we'll make sure that the continuation also returns the same stocks when it's done.

So now inside the continuation here, we want to report on the progress.

So we'll make sure that we don't report the progress if we don't have an instance, and you'll see here that our IProgress interface exposes the Report method.

This allows us to report the progress, and whoever is listening, meaning the event handler, will now get a report that we got an update of our progress.

And because we have an IProgress of IEnumerable of StockPrice, we'll just pass the result from our stockTask, which includes the loaded stock prices for our particular ticker.

You'll notice that as we are requesting the tickers from our server, not only does it update the progress in our application, it also adds some information to our Notes as we are getting these stocks loaded into the application.

For each ticker that we are loading, we're updating our progress bar.

So with very minimum effort, we introduced a progress reporting into our application, but this also illustrates the complexity of introducing progress reporting in your applications because you need to find places in your asynchronous operations where it really makes sense to add progress reporting.

So in this case, it was rather simple.

We could simply report the progress of each IEnumerable of stock price that we got back for our particular ticker.

So depending on the situation, it might be easy for you to add this to your particular asynchronous operation, but in other cases, it might be really hard, especially given the fact that the Tasks themselves don't report on any progress.

You'll need to find ways to get this into your asynchronous methods on your own.

But even given the limitations, introducing IProgress in your applications gives you a nice and easy way to work with progress reporting.

#### Using Task Completion Source

In scenarios where your libraries might not expose asynchronous operations using the Task Parallel Library you can change things in your code to still allow you to use the Tasks.

Now bear with me a second.

Imagine the case where you're, for instance, starting Notepad, and the only way for you to know that Notepad exited is to listen for an event.

In other situations, you might be using an event-based asynchronous pattern like the background worker.

And previously, the only way for you to know that all the data was downloaded was to listen for an event.

And of course, you might have situations in your code where you're manually scheduling work on the ThreadPool.

In those situations, you might want to leverage a Task without having to change too much of your code.

In those situations, it's really handy to use something called the TaskCompletionSource.

And just as the name indicates, it's a way for us to introduce a Task in our applications from other types of maybe asynchronous operations.

So we've got our Click event handler.

The idea here is that we're going to use async and await in our Click event handler just like we've done in the past, but in this case, GetStocksFor the particular Ticker is not going to leverage the async and await keywords, and we're not going to leverage Task.Run or or any of the asynchronous read operations on our file.

So all that we're doing in GetStocksFor right now is queuing work on our ThreadPool.

That means that everything in our anonymous method here will be executing exactly in the same way as we did with our Task.Run, but in this case, we're using the ThreadPool.

So in this case, how do we leverage the TaskCompletionSource to allow us to return a Task from this particular context and then await that like we've done earlier when using the Task Parallel Library together with the async and await keywords.

So let's introduce the TaskCompletionSource and see how we can work with that.

You'll see here that the TaskCompletionSource allows us to specify what type of result that we're expecting out of the Task that we're going to use.

So as it's indicating here, the TResult here represent the producer side of a Task of TResult.

And in our case here, we're going to use an IEnumerable of StockPrice.

When you create an instance of your TaskCompletionSource, you can specify something called the TaskCreationOptions.

It's best practice to use the TaskCreationOption that says that you're going to run the continuation asynchronously.

This avoids running the continuation in line on the same thread, but you can experiment with that on your own.

So now that we have our TaskCompletionSource, how does that fit into the picture? You'll notice here that we have a few really interesting things on our TaskCompletionSource.

We can do things like setting the result, and we can get a Task.

The Task here is something that we can use in order for us to await this somewhere else.

You'll notice here that if we grab the Task out of the TaskCompletionSource, it'll give us a Task of IEnumerable of StockPrice, and that matches our signature of our method.

So what we're going to end up doing here is that when the work has finished from our ThreadPool, we're going to indicate to our TaskCompletionSource that we have a result or a potential exception, and that will indicate to the Task that it's completed.

So whoever is awaiting this somewhere else will then be able to retrieve the result, and it won't proceed to the continuation unless we set the result.

So once we've loaded all the files from disk, we'll use our TaskCompletionSource to indicate that we have a result.

So what this is doing here is that it's loading and processing the file using non-asynchronous methods, but doing that on a separate thread because we queued that onto the ThreadPool.

And then when we have a result available, we'll filter out the prices that we want based on the ticker and then we'll set the result on our TaskCompletionSource, so whoever is awaiting this can then go ahead and grab the result.

And of course, we should set the exception as well if something happens here.

And will you look at that? We in fact got an exception.

So fortunately for us, we added the try and catch block and then called the potential exception.

Now what's really interesting here is that all that we're going in our Click event handler is awaiting this call, and then we're outputting the potential exception to our Notes.

So the problem here is, of course, that we need to skip the first line because that includes the headers.

This here illustrated that the Task for our TaskCompletionSource allows us to work with this just as we would work with any other Task.

And as we get the data loaded from disk, it's going to populate our UI.

And everything worked like it did earlier, and everything in our Click event handler is using the asynchronous principles with async and await, although in our method GetStocksFor, we're leveraging the TaskCompletionSource and setting the result of that Task or the exception from somewhere else.

So let's take a look at another example as well.

So imagine the situation where we don't have any asynchronous operations to indicate that something succeeded or failed.

In this case here, I'm going to start Notepad.

And when Notepad exits, I want to get a notification back to my application, and whoever is awaiting that process to finish can then proceed their execution.

And to get a notification when Notepad closes, we can listen for the exit event.

So the only thing that's missing in here now is our TaskCompletionSource.

We'll introduce a TaskCompletionSource of object because we really don't care about the result that we get out of this.

It's really going to represent work that doesn't return anything.

So now we introduced a TaskCompletionSource, we're going to start a Notepad process, and when Notepad closes, we're going to set the result of our TaskCompletionSource, so whoever is awaiting this call will then be able to proceed and run their continuation.

So this method now returned the Task of our TaskCompletionSource.

So just as we did earlier, we can await this in our click event handler.

So when I click Search now, it's going to start off Notepad, and you'll notice that the loading indicator won't stop until I close Notepad.

We can, of course, also add other things in our continuation, such as updating our notes.

As we close Notepad, it's going to update the Notes, and it's going to stop the loading indicator.

We'll need to look at that.

So now we introduced the TaskCompletionSource in order for us to be able to use the async and await keywords together with components that don't necessarily use the Task Parallel Library themselves.

You can combine these with other types of asynchronous principles like the event-based asynchronous patterns or threading.

You can also, of course, use these for other things like when you receive an event or things like when you're closing Notepad.

So using the TaskCompletionSource is really powerful if you're working with libraries that don't expose Tasks for you to await, but may have operations like callbacks or events.

So now there is really no reason for you not to use async and await in your applications.

#### Working with Attached and Detached Tasks

When you introduce parallel or asynchronous operations, you might have Tasks that need to spawn their own Tasks as well.

Now these nested Tasks are also known as child Tasks, and the Task they originate from is known as the parent.

Now of course there are ways for us to configure how these child Tasks operate, although in order for us to do that, we cannot simply use Task.Run.

Task.Run doesn't have an overload that allows us to configure what's known as the TaskCreationOptions.

In fact, Task.Run is simply a shortcut of using the Task.Factory and starting a new Task from that.

But the Task.Factory allows us to set a whole lot more options.

So we can use the method StartNew on our Task.Factory, and this is in fact what Task.Run uses internally.

You'll see here that we have a lot more overloads that we have with our Task.Run.

And of course, it allows us to pass the action, a CancellationToken, as well as setting the TaskCreationOptions, and then we can pass a value into our Task to avoid closures.

These are the default values that Task.Run will use.

You will see that it will by default set the CancellationToken to None unless we pass the CancellationToken, but then it's also setting the TaskCreationOptions.

For the TaskCreationOptions, we have multiple different ones, and the one that's default for Task.Run is a DenyChildAttach.

This means that Tasks spawned inside our Task here cannot attach themselves to the parent Task, and we'll have a look at that in just a moment.

And then it's setting the TaskScheduler to the Default scheduler, which is simply going to use the ThreadPool, to queue this work.

Now this here gives us a little bit more flexibility, but it's also only supposed to be used for more complex and advanced scenarios.

So in most cases, you're better off using Task.Run.

But in our case, we want to configure the TaskCreationOptions for the child and parent Tasks, so Task.Factory .StartNew will simply queue an operation on our ThreadPool.

We'll add something to the debugger before and after this operation completes, and of course, we need to await this asynchronous operation as well.

Now imagine this Task here will start off more Tasks, and we want to be able to configure how they operate.

So in this make-believe scenario, what we are doing here is that we are creating an asynchronous operation, which in its turn is creating three additional asynchronous operations.

By now, you should probably be familiar with what happens when we execute the application.

Notice that it first said Starting and then immediately said completed.

Then it's completing 1, 2, and 3 pretty much at the same time.

Of course, given everything we've learned throughout this course, this makes a lot of sense because it'll immediately schedule off the work for each nested Task that we have in our parent Task here, although what we can do now is that we can configure that we want to attach these to the parent Task.

So we can indicate that we want to attach this particular Task to the parent.

And of course, as this very long documentation here is telling us, by default, the child Task, that is, the inner Task, created by the outer Task executes independently of its parent.

And you can use this option called AttachToParent so that the parent and child Tasks are synchronized, although it's also telling us that if the parent Task is configured with DenyChildAttach, setting this option has no effect.

So that'll just then work as a detached, nested, or a child Task.

So if we were to use Task.Run and then use the Task.Factory .StartNew within Task.Run, we would not be able to attach to that particular parent.

And of course, if we simply attach the first one, it'll say Starting, it'll complete the first one that we attach to the parent, and when the first one is completed, since the parent and child are synchronized, it'll then say that the parent Task is completed.

So we can do this change for all our nested Tasks in this context.

And of course, as we run this, it'll tell us that it started, it completed the first one, and then the second one, then the third one, and then after that, it noted that our parent Task completed successfully, and we're running the continuation after that.

So this means that we didn't in fact reach the continuation for the outer Task until the attached child Tasks were all done.

So this here gives us a lot of flexibility.

And if we change this to DenyChildAttach, you'll notice that it's telling us that it started and then completed, and then of course, it's completing the child Tasks after that.

So this here illustrates how it would work with Task.Run.

So here's another example of doing pretty much the same thing.

In our situation, we have all the stocks loaded in the application, and then we want to perform some computation on each different particular ticker's stock prices.

So we created this asynchronous operation, and then for each ticker and its prices, we create a new Task using the Task.Factory and we attach that to the parent.

So this here illustrates that we can use the TaskCreationOptions to indicate that we don't want to mark our Task as completed until all the nested child Tasks are completed.

We could of course use async and await internally here as well, but introducing async and await introduces a lot more boilerplate code.

That means that it might have a slight performance implication.

Before we move on, let's talk about one more thing in regards of using the Task.Factory.

Given our case here, we start off an asynchronous operation using the Task.Factory, it has an asynchronous anonymous method, which leverages our StockService.

There are two things that are particularly interesting here.

Now normally what you'd get when you're doing Task.Run and then internally of that you have an async and await and then that returns a value, that would give you the particular value.

That's because not only does Task.Run work as a shorthand of just introducing the TaskCreationOptions, it will also automatically unwrap.

So that means that if we want to get the result out of this operation, normally when doing Task.Run, we'd do await operation, and the content of the result variable will then be our stock prices, although in our case here what's in fact returned from our anonymous method is a Task of our IEnumerable of StockPrices.

So this means that operation here will in fact also return a Task.

So in order for us to get the StockPrices out of our operation here when using the Task.Factory, we'll have to do await to first get the internal asynchronous operation and then do await once more to get our IEnumerable of StockPrices.

So now you'll notice here that we are getting an IEnumerable in our result here.

So when we're using Task.Run, we don't have to worry about this because it's automatically unwrapped.

So we can also unwrap this Task here, and that's just a way to create a proxy Task that represents the asynchronous operation of a Task of a Task of T.

So pretty much, as the example shows here, we can do await Unwrap, and that'll give us the IEnumerable of StockPrice instead of giving us the Task of IEnumerable of StockPrice.

So now when we unwrap this Task here, we no longer need the two await keywords.

But don't worry, Task.Run does this for us.

But if you start working with the Task creation options and use the Task.Factory, you'll run into all of these situations that Task.Run solves for you, but you may be working in some advanced scenarios where you need to use the Task.Factory.

Now I mentioned that there are two things that I think are interesting here, and the second thing being in our anonymous method here, we are using our service, and using the service inside our anonymous method introduces a closure, and you might not want to do that as this introduces unnecessary allocations.

So there is another overload that we can use with the Task.Factory.

We can in fact send an object, an object containing data to be used inside our action delegate.

So we can pass the service here.

And then of course, we need to take that as a parameter to our anonymous method, we'll cast this to a StockService, and now we can use the StockService.

So this here avoided unnecessary allocations by avoiding a closure, so this here illustrates that using Task.Factory is flexible and it's great for complex and advanced scenarios where we might need to change how the child and parent Tasks behave.

But then again, in most situations, you're better off just using Task.Run.

#### The Implications of Async and Await

The time has come to talk about the implications of applying async and await in your applications.

We're going to discover some of the code that's generated when you apply these keywords, and we'll talk about some of the problems that you might run into because of that.

Understanding how async and await works internally definitely makes it a lot easier for you to find potential problems in your applications.

I've mentioned a few times that introducing the async keyword introduces something called a state machine.

Now understanding the particular implementation of the state machine isn't as important as understanding its purpose.

The state machine is really there to keep track of the Tasks is your current asynchronous context.

It's also in charge of executing the continuation and thus giving back the potential results.

It also ensures that a continuation executes on the correct context, which means that it also handles the context switching, and it's also in charge of reporting back the errors that you might be receiving inside your asynchronous operations that you're awaiting.

So given our Search_Click event handler, this is a very simple method.

And of course, if we compile this application and look at the code inside something like .NET Reflector, now .NET Reflector will take our binary and decompile the application.

This means looking at the IL that was generated by our compiler, and then it's showing this as C#.

So this here is an equivalent to what we have in Visual Studio.

In fact, it looks very similar.

But now what happens when we mark our Search_Click event handler as async? In our application, all that we're getting now is a hint that we should probably not mark this as async unless there is an await keyword.

But behind the scenes, what's going to happen here is interesting because this actually has quite a big impact on the code that's generated.

Our Click event handler now turned into something totally different.

This code here doesn't look anything like what we had in Visual Studio.

It introduced something called the stateMachine.

Now a stateMachine is generated for every method that you mark as async, so each method that you have marked as async will be turned into something like this.

You can see there that it's using something called the AsyncVoidMethodBuilder, which is in particular something that it's using for something that's marked as AsyncVoid, and then of course, it's starting this process using the stateMachine.

The stateMachine, of course, also takes care of things like running the continuation.

Let's just quickly jump into our stateMachine.

And here we have it.

This is our stateMachine that was generated for our Search_Click event handler.

You'll notice here that there's a method called MoveNext.

So this is where everything happens.

And notice something rather familiar.

We have our Notes.Text and our Ticker.Text in here, and of course, it's also using the reference to the MainWindow.

So it took all the code from our Search_Click event handler, it moved it into this generated method inside a try and catch block, it's catching an exception, and then it's using this builder to set the exception if there is one or to set a result to indicated that it completed successfully.

So this here is a rather drastic change to what's inside our application, all with just a simple async keyword.

And of course, when it's using the AsyncVoid method builder and trying to set the exception, there is no Task to set it on, so that'll just tear down the application.

Now I also introduced this method called Run here, which is marked as async, returns a Task, it has an await inside of it to await a particular asynchronous operation, which in this case just immediately returns the string Pluralsight, so what do you reckon is going to happen here? The first thing that's interesting is that we now have two stateMachines.

We have one for the Run method and one for our Search_Click event handler.

And of course, if you'll look at the signature and then what this method returns, you can see that it returns the stateMachine's builder's Task, which is a reference to all of that ongoing asynchronous operation that's currently going on.

This Task is what will have the potential exception, result, or a cancellation set on it.

So again, this here changed the method, but in this case, we also used the await keyword.

So of course, MoveNext inside this particular stateMachine is going to look a little bit different.

The stateMachine keeps track of the current state, it has an awaiter to keep track on the current ongoing operation to know if it completed, and it's leveraging things like the goto keyword and so forth.

So you don't have to worry about understanding everything in here.

This just shows you the complexity of introducing the async and await keywords.

Now what happens if we have code inside our continuation? Where do you think this code would live inside our generated stateMachine.

You'll notice here at the bottom we can see code that's executed inside our continuation.

We have the if statement checking if this string is Pluralsight, and then it's doing the Debug.WriteLine call with that particular string.

So again, this here shows to you that what's generated here is rather complex, so it's doing a lot of heavy lifting for us.

By applying the async and await keywords, it makes it a lot easier for us to work with asynchronous principles, but the heavy lifting done by the compiler should not be looked on lightly.

There is a lot of really clever things going on here.

I generally don't really like overengineering my solutions, but this here is going to prove an interesting point.

In this case here, we have this method called run, which in its turn called Compute, which in its turn called load, and when load has executed all of its processing, it returns the result out of that asynchronous operation, Compute will await Load and get the result and return that, and then run awaits that asynchronous operation as well, and returns the result.

And of course, if we compile this and look at the generated code it introduces the stateMachine for Run, Load, and Compute.

Now introducing the stateMachine, as we saw, introduces complexity.

And given this scenario, do we really need introduce a stateMachine for each of these different operations? Since the async keyword doesn't in fact change the signature of the method, we can persist the signature of the methods and just remove all of the async and await keywords, and then all of the sudden, we reduced the complexity that was generated by introducing the async and await keywords.

Whoever is calling run should be the one that's awaiting this call.

So even though it's really simple for us to introduce the async and await keywords whenever we are doing asynchronous operations in our applications, be very cautious about it.

Thing about the situations that you're working in and if there is a way for you to improve the performance of your application by allowing your caller to take care of that asynchronous operation instead.

That could potentially allow you to reduce the amount of complexity generated when you're compiling your code.

#### Deadlocking

Let's talk about making our applications useless, and we can do that by introducing a deadlock.

A deadlock, as you might imagine, is a real terrible situation to end up in.

It means that we could, for instance, have our UI thread.

The UI thread is locked because it's waiting for some operation to complete, and that operation cannot complete unless it can communicate back to the UI thread.

So why would we want to do that in our applications? Of course, it's to understand how to avoid the problem.

So in our example here, we are calling LoadStocks.

LoadStocks is an asynchronous method, it's marked as async, and it returns a reference in that ongoing operation, so we can simply await this call by using the async and await keywords.

But what I really want to do is to make this call synchronous.

So I want to force this to block here until we have a potential result.

So since this here is a Task, we can simply call Wait here and hope that it won't proceed executing the code beneath it until this asynchronous operation has completed.

Running the application results in a deadlock, so that's rather terrible, but that kind of proves the point that it's super easy for us to get a deadlock, especially when introducing async and await.

So home come this here introduced a deadlock? Given the fact that we now know what happens when we introduce the async and await keywords, can you figure out why this is deadlocking? The reason it's deadlocking is because everything inside the stateMachine is being executed on the original context.

That means that the stateMachine is being executed on our UI thread.

So if that's the case, this means that we are blocking our UI thread so that it cannot proceed executing the stateMachine, which means that the thread that's currently completing cannot communicate back to the stateMachine that it's completed.

To illustrate this in a different way, imagine the following situation.

We create this asynchronous operation, the asynchronous operation needs to use the Dispatcher or the synchronization context to call back to the original context.

Now we were using the Wait method here to indicate that we want to lock the thread until all the processing has completed, but this process can never complete because it cannot communicate back to the original context so hence we have a deadlock.

So in the situations that we really want to do this, I'm going to show you a little bit of a hack that you can do to make this work.

So now what we're doing here is that we're taking our stateMachine for LoadStocks and we're executing that somewhere else, and then we were blocking the UI thread, but we're not blocking the particular stateMachine.

Now what do you reckon happens in the application when we do this? We in fact got an exception.

It didn't block our current context.

We didn't get a deadlock, so that's a slight improvement.

Since we moved everything from loadStocks to a different thread, that means that it can no longer update the UI.

So we fixed one problem and introduced a new one.

Although this illustrates that it's so easy for us to get a deadlock, and it's mainly because we forget about the fact that the stateMachine runs on our original context, and when we are trying to block that original context by using Wait or trying to get the result property, that will lock the original context so there is no way for the stateMachine to be marking this thread as completed.

So if there is really one thing that you should take out of this, it's to simply avoid blocking your asynchronous operations because that kind of makes asynchronous operations pointless anyway.

#### Asynchronous Streams

In C# 8, we are getting an addition to the language that allows us to work with something known as asynchronous streams.

This means that if we, for instance, load something out of the web, the database, or from our disk, we can process the data as it's being loaded, of course, as long the libraries that we use support that.

So given this example here, we have this console application that gives us an asynchronous Main method, we're going to request the particular ticker, and then we I'm going to search through the file on our disk, and as soon as we find the ticker that we are looking for, it'll return that, and we can process each ticker as we are getting that in our foreach loop.

So what we have here is that we have the await keyword in front of our foreach loop.

If we simply read this from left to right, it tells us that we are going to await for each stock that we find in our LoadStocks for the particular ticker.

Essentially, what that means is that we're going to get a stock as soon as it's available.

So how would that work? If we scroll down to LoadStocks in our DataStore, we see here that the method is marked as async and it's returning something called an IAsyncEnumerable of StockPrice.

So you can think of that as being our asynchronous operation, but compared to a Task which simply returns one value, this will return multiple values as they are available.

So then we start loading the file.

We read each line in the file.

What we are doing is we are converting that into our particular data model that we were using in the application, and then at the bottom here, you noticed that we were asking if we found the particular ticker that we were looking for.

Now remember that this is being executed for each line in the file.

So it's first taking the line in the file, converting that into our StockPrice, and then we are checking that against the particular ticker that we're looking for.

Then we are using the yield keyword to return that particular price.

That will indicate to the IAsyncEnumerable to in its turn indicate to the foreach loop that we're using the await keyword with that there's now an available price to process.

And then just to simulate that there is some workload here since I'm loading this from a really fast SSD, I'm just introducing a fake delay here just to simulate some workload.

So again, the body of the foreach loop will run for each price as soon as it's available.

Traditionally, you probably had something in terms of this here where you said that for each stock in the result out of LoadStocks, we're going to process each stock, but this here would have to wait for all the stocks to be loaded, and we really don't want to do that.

We want to be able to process the prices here in our foreach loop as soon as they're available.

If we run the application and search for the Microsoft ticker, you'll notice here that it starts echoing out the Microsoft tickers and the changes to the prices, and it's doing so based on every time that it's loaded from our file.

So this here illustrates how we can work with streams of data in an asynchronous manner.

Just imagine what you'll be able to do with this.

So this feature is available in C# 8, and the IAsyncEnumerable is available .NET Core 3.

But this here shows you that using these asynchronous streams in your applications can improve your applications a lot because you no longer have to wait for the entire chunk of data to be loaded or having to introduce really complex code to solve the same problem.

#### Summary and Final Words

In this module, we covered a whole lot of interesting things that will hopefully make you a much better developer when it comes to introducing asynchronous and parallel principles in your applications, especially when using the Task Parallel Library or the async and await keywords.

We now have an understanding of the internals of async and await, and this gives you an insight into the implication of introducing these two keywords in your applications and understanding the complexity that comes with introducing async and await and potential problems is really crucial to build powerful and solid applications.

And again, we touched on the fact that using async void in your applications is really a bad idea.

The stateMachine will automatically return a Task as long as you mark your methods as async Task.

So there's really no point of using async void unless it's for an event handler.

We also talked about how we can introduce the TaskCompletionSource in your applications.

In situations where you might have other operations going on and you want to use the async and await keywords together with that, those are perfect situations for when to introduce the Task completion source, and we also saw a use case for when to use this when we get things like events to use that together with the async and await keywords.

In our situations, we awaited someone to close Notepad.

We also saw the fact that Task.Run does a lot of great things for us.

But if we want total flexibility, we can tweak how the child and the parent Tasks are operating together.

We can make sure that we attach the child Tasks to the parent Task and only have the parent Task marked as completed as soon as all the nested child Tasks are all completed.

This will give you total flexibility when introducing the Task Parallel Library, and we saw this by using the Task.Factory like many have used in older versions of .NET.

But in most of the situations, using Task.Run will be completely enough for your particular situation.

We also talked about the fact that it's really hard to report the progress of a Task because there is no built-in support in your Task to know the progress of that particular asynchronous operation, and that of course makes a lot of sense, especially since there is no way for your computer to know exactly how much processing is left to do until your Task is done because your guess is probably as good as a computer's on how long the Task has left to be processed.

So what you need to do is that you need to introduce ways for you to manually report the progress of your Tasks, and you do this by introducing Progress and IProgress of T.

And we saw that it is really easy for us to add that into the application, but then we also saw that it's really complex to find places where to put the progress reporting.

And then finally, we saw how we can work with the asynchronous streams in C# 8.

This gives you a really great experience when working with streams of data.

No matter if that's coming from the web, your disk, or a database, this gives you a quicker way to work with the particular data that's already been loaded into your application without having to wait for the entire workload to finish.

I'm really proud of you for making it to the end of this course.

We've covered so much in this course around how to apply asynchronous principles in your .NET applications.

Hopefully by now, you have a really good understanding of how to work with async and await, the Task Parallel Library, Parallel Extensions, and how to tweak your applications to be a lot better.

And all that we want is of course to give our end users a really good experience when using our applications.

So with all this new knowledge, you are now ready to tackle all these different situations in your applications.

Now go ahead and build really powerful and great applications by applying the asynchronous principles in your applications.

You've been watching Getting Started with Asynchronous Programming in .NET.

My name is Filip Ekberg.

Thank you for participating in this course.

