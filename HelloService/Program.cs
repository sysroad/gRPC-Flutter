using System;

namespace HelloService
{
    class Program
    {
        static void Main(string[] _)
        {
            var server = new GreetServer(50051);
            server.Start();

            while(Console.ReadLine() != "exit") { }

            server.ShutDown().Wait();
        }
    }
}
