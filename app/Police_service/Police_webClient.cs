// Decompiled with JetBrains decompiler
// Type: newweb.Police_service.Police_webClient
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System.CodeDom.Compiler;
using System.Diagnostics;
using System.ServiceModel;
using System.ServiceModel.Channels;

namespace newweb.Police_service
{
  [DebuggerStepThrough]
  [GeneratedCode("System.ServiceModel", "4.0.0.0")]
  public class Police_webClient : ClientBase<IPolice_web>, IPolice_web
  {
    public Police_webClient()
    {
    }

    public Police_webClient(string endpointConfigurationName)
      : base(endpointConfigurationName)
    {
    }

    public Police_webClient(string endpointConfigurationName, string remoteAddress)
      : base(endpointConfigurationName, remoteAddress)
    {
    }

    public Police_webClient(string endpointConfigurationName, EndpointAddress remoteAddress)
      : base(endpointConfigurationName, remoteAddress)
    {
    }

    public Police_webClient(Binding binding, EndpointAddress remoteAddress)
      : base(binding, remoteAddress)
    {
    }

    public GET_NAME Check_user(string idx)
    {
      return this.Channel.Check_user(idx);
    }
  }
}
