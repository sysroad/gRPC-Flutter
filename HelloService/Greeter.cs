using System.Threading.Tasks;
using GrpcGreeter;
using Grpc.Core;

namespace HelloService
{
    public class GreeterService : Greeter.GreeterBase
    {
        public override Task<HelloReply> SayHello(HelloRequest request, ServerCallContext context)
        {
            return Task.FromResult(new HelloReply {
                Message = $"Hello {request.Name}"
            });
        }
    }

    public class GreetServer
    {
        readonly Server server;

        public GreetServer(int port) 
        {
            server = new Server {
                Services = { Greeter.BindService(new GreeterService()) },
                Ports = { new ServerPort("localhost", port, ServerCredentials.Insecure) }
            };
        }

        public void Start() { server.Start(); }

        public async Task ShutDown() { await server.ShutdownAsync(); }
    }
}