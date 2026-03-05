// Decompiled with JetBrains decompiler
// Type: newweb.Police_service.IPolice_web
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System.CodeDom.Compiler;
using System.ServiceModel;

namespace newweb.Police_service
{
  [ServiceContract(ConfigurationName = "Police_service.IPolice_web")]
  [GeneratedCode("System.ServiceModel", "4.0.0.0")]
  public interface IPolice_web
  {
    [OperationContract(Action = "http://tempuri.org/IPolice_web/Check_user", ReplyAction = "http://tempuri.org/IPolice_web/Check_userResponse")]
    GET_NAME Check_user(string idx);
  }
}
