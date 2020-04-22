using System;

namespace MyService
{
    class Program
    {
        static void Main(string[] _)
        {
            var server = new MyServer(50051);
            server.Start();

            while(Console.ReadLine() != "exit") { }

            server.ShutDown().Wait();
        }
    }
}
