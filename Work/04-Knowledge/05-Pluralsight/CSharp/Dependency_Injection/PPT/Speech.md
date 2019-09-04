Ok, welcome to the workshop, Getting Started with Dependency Injection in .NET. 

Dependency Injection now is a very popular technology used in many frameworks. Maybe some of you is familiar with this concept, but if not, then i think it's an opportunity to know what is DI and how and why to use it. 

i will also give a brief introduction of the SOLID principles and the usage of repository and decorator patterns.

so, what's Dependency Injection, different developers have different answers, even the definition on the wikipedia changed for many times. here, i selected one difinition which tell us that Dependency Injection is A set of software design principles and patterns that enable us to develop loosely coupled code. so, from this definition, we know that DI belongs to software design patterns related technologies. and it's used to develop loosely coupled code.

so, here comes the first question, why we want to develop loosely coupled code, that is, what's the benefit of loosely coupled code. i think most of you have already known these items. with loosely coupled code, it's easyer to extend, test, maintain. it prevents the merge conflicts and also makes the late binding more easier. 

in this workshop, i will show you how we get these benefits within a demo application using dependency injection. the application is very simple, it only provides a single screen. we can get the person data from a web service or clean the screen, that' all. and it's also more complex than it should be. because i seperate the application into four layers in the code level for demonstrate purpose.

so before we continue, let's have a code review for this demo, and it won't take much time.

first let's run the application to see if it works. i clicked the refresh people button, and find that there's no data can be shown, because we request data from a web service, but it's not launched yet. so we should first run the service. let's come to cmdline and swith to the folder of web service project. it's a dotnet core application, so i can type dotnet run. 

now the webservice is running, we can test with our web browser, localhost:5001/api/people, we can see the browser got the data in JSON format.

so let's come back to the demo, we refresh the data again, this time, we can see the person data is shown. we can clean and refresh as much as times you like.

let's come back to the visual studio. this is a WPF application with MVVM framework. the application is serpated into four layers, peopleviewer project is in the view layer, peopleviewer.presentation is in the presentaion layer, personRepository.Service is in the data access layer and the data from webservice is in the data store layer, it's not included in this solution and not have much relation with our topics today.

so, in the view layer, we have the PeopleViewerWindow class, in the xaml scripts, we can see the refresh people button is bind to RefreshPeopleCommand which is in the PeopleViewModel, and at the code behind, it initialized a instance of PeopleViewModel as the datacontext, tom have given the workshop about WPF, so i assume you are familiar with the concept of command, data binding, and context.

so let's come to the class PeopleViewModel, in the constructor of PeopleViewModel, it initialized the ServiceReader, and when we click the refresh people button on the UI, the method Execute in class RefreshCommand will be called, and it will call the method GetPeople, we can see it's in the servicereader class in data access layer.  so there're not much code here, i just want to show you how our application functioning.

is there any part that you are not clear about we can have a look again.

ok, let's continue.

we've seen that the application has a good seperation with 4 layers, and it seems looks good. but it does have some issues.

first, in the contructor of class peopleViewerWindow, we inialized the peopleViewModel, that means the view layer is tight couled with the presentaion layer, what's more, in the contructor of class peopleViewModel, we initialized the ServiceReader, that means, the presentation layer is tight coupled with the data access layer, and in the service reader , we create a webclient and get the data through the webservice, that means ,the data access layer is tight coupled with the data store, the tight coupling between the data access layer and the data store can be accepted, because it should always know some details when getting the data, but the problem is that now we have the tight coulping between the view layer and the data store. it's not acceptable.

and let's see some new requests and you would know what problem we have with tight coupled code.

first, we need the client support to get data from different data source. not only from the web service, but also from CSV file, database or some other sources.

so maybe what we can do is to change the code in the constrcutor of the peopleviewmodel, to initialize one specific Reader according to the condition. 

secondly, we need a client side cache so that we do not need to send request to the webservice each time we click the refresh people button. we can cache the data in the memory for a while.

so we need more switch cases in the constructor of the view model, add a cache type reader for each data source.

here comes the issue.
when we write many switch cases or if else branches, we should think about if we are writing the correct code, but why?

the answer is that in our cases, it violate one of the SOLID principles - Single Responsibility Principle. the view model in this demo have too much Responsibilities, it's Responsible for presentation logic, for picking the data source, for manage the object lifetime, for decide to use or not use the cache. but the Single Responsibility Principle told us that A class should have only one reason to change. so for the viewmodel, the reason for modify it is the change from the presentation logic.

let's continue to see the third request. we need add unit test to our code. for example, when we try to test the peopleviewmodel, we need to initailize the peopleviewmodel, the viewmodel will initailize the service reader, and the service reader will initialize the webclient, the problem is if we want the unit test get passed, we need the production environment, that is, the webservice should be running, but you can not tell your CM that, in order to get the unit test passed, you should keep the webservice be running on the build machine,

so those are the issues the tight-coupling code comes with.

so, now what we can do to solve the issues. one way is using the Dependency injection. let's see how.

we've seen that the main problem comes from the tight coupling of the presentation layer and data access layer. so let's demonstrate how to de-couple them. there're three steps.

first, we will add an abstraction layer.
secondly, we will use constructor injection to de-couple the code.
finally, we will composite the de-coupled modules together.

so, first we introduce the repository pattern to separates our application from the data storage technology. we introduce an interface as the standard for different data reader. that is, let each data reader to inherit the interface. normally, the repository pattern include create, read, update, delete methond, but in our cases, we only need read method, so we only reserve GetPerson methond in the interface. this is also following the SOLID principle - Interface segregation. the clients should not be foreced to depend upon interfaces that they don't use.

the second step is to use constructor injection. we replaced the field variable ServiceReader with abstraction IPersonReader. and instead of intialize the data reader in the constructor, we inject the object through the constructor, so the data reader is the dependency, and this is why we call it dependency injection. 

if we build the solution, we will found that there's errors in PeopleViewerWindow, because it tries to call the default constructor of PeopleViewModel. so we should provide a data reader to the viewmodel object. but create data reader is not viewmodel's responsibily, so it should also not the peopleviewWindow's responsibility. what we can do is again using the constructor injection, we inject the view model through the constructor.

the last step now is to compose the de-coupled modules together, we come to the OnStartup method in class App, this is the place to launch the application. and we can call it the bootstrapter, here, we initaillize the data reader, inject to the viewmodel when initalize the viewmodel, and inject viewmodel into the windows when initailize the peopleviewwindow. so now we composed the modules together in the bootstrapter.

if we comes back to the class peopleviewmodel, we will find another SOLID principle - dependency inversion principle. that is ,High-level modules should not depend on low-level modules. Both should depend on abstractions.Abstractions should not depend upon details. Details should depend upon abstractions.we didn't remove the dependency from the viewmodel, but change the way to use the dependency, the viewmodel depends on the abstraction IPersonReader. and for ServiceReader，it also depend on the abstraction IpersonReader. we will see the benifits of loosely coupled code in the last request of unit test, so let's continue the second request first, it's to add a client side cache. to implement this, we introduce the decorator pattern, i will show you in the code, so let's back to the visual studio. 

in order to add cache functionality to the application. what we need to do is initalize the cachingReader, and inject the servicereader into the object, and then inject the cachingreader into viewmode object. this is the only place that i did change for existing code. we build and run the application again, we refresh people, and close the webservice, clean the data, refreash people again, because we only cache the data for 15 seconds, so wait for a while, we clean the data, refresh again, we find the in memory data is expired.

now, let's have a look at the cachingreader with decorator pattern, first the cachingReader is also a IpersonReader, and in the constructor of the class ,it inject another Datareader, so the input and output of the cachingReader is the same kind of object, that's why the pattern called decorator. for example, no matter someone has necklace or not, she is a person, the necklace is just for decorate, in our cases, it add caching functionality to our data reader. so we will find that decorator pattern is very suitable for add additional functions to existing module. we can add client cache, or add logging,or also add validation and so on.

so through the second request, we find that we did not do any changes to the servicereader, we did not do any changes to the view model. this is what we called Open/Closed Principle, also one of the SOLID pinciple, it tells us that software entities should be open for extension, but closed for modification.

and we also have seen that with loosle coupled code, we make the unit test more easier and This encourages us to use them and write more tests when needed.

in reality project, we often use dependency injection containers, instead of implement ourselves, there're a lot of DI containers we can choose in .net, i will deomnstrate the Ninject Container in this workshop, now we have a good understanding of dependency injection, i think it's get easier to understand how to use the DI container, first we should add the referance to the ninject library. i did this by using nuget packages. we have the field variable Container with type Ikernal, and if we want to cache, we told the container that to register the IPersonReader with CachingReader using Bind method, and we seelct the lifetime management types with InSingletonScope, and we also know that Cachingreader need a IPersonreader, so we told the container that we want to provide a CSVReader to the cachingreader, if not, then we just register the IpersonReader with CVSReader.

then we call the Get methon on the container, to get the object of type peopleViewerWindow.

so here, do you find any part is missing? 
it's the PeopleViewModel.
but if we rebuild and run the application, and we can see it still have the same functionality we have before.

it's a little magic here, but we can explain, the conatiner want to initialize the peopleviewwindow, and it find that the window need a parameter of PoepleViewModel, but the complier won't provide the object, so the container initialized the object itself by reflection, and when initialize the PeopleViewModel, the Container find the viewmodel need a IPersonReader, but the Container can not decide which concrete type it should use, so it will refer to the type we registered, we registered the type of CachingReader, so it will initialize the CachingReader and inject into view model object,
so DI container often do something behind the screen, if you don't know the Di and see this kind of code, you will get confused.

ok, that is all the content about Di in this workshop. is any questions?

ok. finally there's some comments on this workshop, this workshop is not a recomendation that we should use DI as possible as we can, it also have some disadvantage like, it makes it more slower when launch the application, becuase with reflection technology, it makes the application more maintainable but more complex to understand at the beginning. so the purpose of this workshop at least is to help us understand the code, when we get the project from others, we can know what kind of design patterns they are using, and the possible reason that they use it. that's some opitions from myself.