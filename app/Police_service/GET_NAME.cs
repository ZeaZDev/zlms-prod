// Decompiled with JetBrains decompiler
// Type: newweb.Police_service.GET_NAME
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.CodeDom.Compiler;
using System.ComponentModel;
using System.Diagnostics;
using System.Runtime.Serialization;

namespace newweb.Police_service
{
  [DataContract(Name = "GET_NAME", Namespace = "http://schemas.datacontract.org/2004/07/Police_link")]
  [DebuggerStepThrough]
  [GeneratedCode("System.Runtime.Serialization", "4.0.0.0")]
  [Serializable]
  public class GET_NAME : IExtensibleDataObject, INotifyPropertyChanged
  {
    [NonSerialized]
    private ExtensionDataObject extensionDataField;
    [OptionalField]
    private string NAMEField;
    [OptionalField]
    private string RANKField;
    [OptionalField]
    private string WORKPLACEField;
    [OptionalField]
    private string YEARField;

    [Browsable(false)]
    public ExtensionDataObject ExtensionData
    {
      get
      {
        return this.extensionDataField;
      }
      set
      {
        this.extensionDataField = value;
      }
    }

    [DataMember]
    public string NAME
    {
      get
      {
        return this.NAMEField;
      }
      set
      {
        if ((object) this.NAMEField == (object) value)
          return;
        this.NAMEField = value;
        this.RaisePropertyChanged(nameof (NAME));
      }
    }

    [DataMember]
    public string RANK
    {
      get
      {
        return this.RANKField;
      }
      set
      {
        if ((object) this.RANKField == (object) value)
          return;
        this.RANKField = value;
        this.RaisePropertyChanged(nameof (RANK));
      }
    }

    [DataMember]
    public string WORKPLACE
    {
      get
      {
        return this.WORKPLACEField;
      }
      set
      {
        if ((object) this.WORKPLACEField == (object) value)
          return;
        this.WORKPLACEField = value;
        this.RaisePropertyChanged(nameof (WORKPLACE));
      }
    }

    [DataMember]
    public string YEAR
    {
      get
      {
        return this.YEARField;
      }
      set
      {
        if ((object) this.YEARField == (object) value)
          return;
        this.YEARField = value;
        this.RaisePropertyChanged(nameof (YEAR));
      }
    }

    public event PropertyChangedEventHandler PropertyChanged;

    protected void RaisePropertyChanged(string propertyName)
    {
      PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
      if (propertyChanged == null)
        return;
      propertyChanged((object) this, new PropertyChangedEventArgs(propertyName));
    }
  }
}
