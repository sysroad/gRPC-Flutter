using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GrpcGreeter;
using GrpcCharting;
using Grpc.Core;

namespace MyService
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

    public class ChartingService : ChartData.ChartDataBase
    {
        readonly Random rand = new Random((int)DateTime.Now.Ticks);

        public override Task<PointsReply> SampleData(PointsRequest request, ServerCallContext context)
        {
            var reply = new PointsReply();

            for (int i = 0; i < 360; ++i)
            {
                reply.Points.Add(new Point{
                    X = i,
                    Y = rand.NextDouble() * 30
                });
            }

            return Task.FromResult(reply);
        }
    }

    public class MyServer
    {
        readonly Server server;

        public MyServer(int port) 
        {
            server = new Server {
                Services = { 
                    Greeter.BindService(new GreeterService()),
                    ChartData.BindService(new ChartingService())
                },
                Ports = { new ServerPort("0.0.0.0", port, ServerCredentials.Insecure) }
            };
        }

        public void Start() { server.Start(); }

        public async Task ShutDown() { await server.ShutdownAsync(); }
    }
}