using System;
using System.Collections.Generic;
using System.Web.UI;

namespace DevExpress.Web
{
    public class ASPxButton : Control { }
}

namespace DevExpress.Web.ASPxScheduler
{
    public class ASPxScheduler : Control { }
}

namespace DevExpress.Web.ASPxTreeList
{
    public class ASPxTreeList : Control
    {
        public void ExpandToLevel(int level) { }
    }
}

namespace DevExpress.XtraReports.UI
{
    public class XtraReport : IDisposable
    {
        public static XtraReport FromFile(string path, bool useCache) => new XtraReport();
        public virtual void Dispose() { }
        protected virtual void Dispose(bool disposing) { }
        protected void EndInit() { }
    }

    public class DetailBand { }
    public class TopMarginBand { }
    public class BottomMarginBand { }
}

namespace DevExpress.XtraReports.Web
{
    using DevExpress.XtraReports.UI;

    public class ASPxDocumentViewer : Control { }

    public class ASPxReportDesigner : Control
    {
        public void OpenReport(XtraReport report) { }
    }

    public class SaveReportLayoutEventArgs : EventArgs { }
}

namespace System.Web.UI.DataVisualization.Charting
{
    public class Chart : Control
    {
        public SeriesCollection Series { get; } = new SeriesCollection();
        public ChartAreaCollection ChartAreas { get; } = new ChartAreaCollection();
    }

    public class SeriesCollection : List<Series>
    {
        public new Series this[int index]
        {
            get
            {
                while (Count <= index)
                {
                    Add(new Series());
                }

                return base[index];
            }
            set => base[index] = value;
        }
    }

    public class ChartAreaCollection : List<ChartArea>
    {
        public new ChartArea this[int index]
        {
            get
            {
                while (Count <= index)
                {
                    Add(new ChartArea());
                }

                return base[index];
            }
            set => base[index] = value;
        }
    }

    public class Series
    {
        public string Name { get; set; }
        public bool IsValueShownAsLabel { get; set; }
        public DataPointCollection Points { get; } = new DataPointCollection();
    }

    public class DataPointCollection
    {
        public void AddXY(object xValue, object yValue) { }
    }

    public class ChartArea
    {
        public Axis AxisX { get; } = new Axis();
    }

    public class Axis
    {
        public bool IsLabelAutoFit { get; set; }
    }
}
