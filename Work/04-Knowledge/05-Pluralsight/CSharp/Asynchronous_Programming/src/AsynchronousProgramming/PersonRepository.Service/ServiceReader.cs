using Newtonsoft.Json;
using People.Common;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace PersonRepository.Service
{
    public class ServiceReader : IPersonReader
    {
        public void GetPeople()
        {
            using (var client = new HttpClient())
            {
                var UIThreadStr = "UI Thread: " + Thread.CurrentThread.ManagedThreadId.ToString()+"\r\n";

                Action<string> showMsg = (msg) => {
                    System.Windows.MessageBox.Show(msg + Thread.CurrentThread.ManagedThreadId);
                };

                var task = client.GetAsync($"http://localhost:5001/api/people1/");

                CancellationTokenSource cancelSource = new CancellationTokenSource();

                task.ContinueWith(t =>
                {
                    IEnumerable<Person> result = null;

                    try
                    {
                        var response = t.Result;
                        response.EnsureSuccessStatusCode();

                        var str = response.Content.ReadAsStringAsync().Result;

                        result = JsonConvert.DeserializeObject<IEnumerable<Person>>(str);
                    }
                    catch (Exception err)
                    {
                        System.Windows.MessageBox.Show(UIThreadStr + "Continue Thread: " + Thread.CurrentThread.ManagedThreadId);
                    }
                }, cancelSource.Token, TaskContinuationOptions.NotOnRanToCompletion, TaskScheduler.Default);

            }
        }

        public Person GetPerson(string lastName)
        {
            throw new NotImplementedException();
        }


    }
}
