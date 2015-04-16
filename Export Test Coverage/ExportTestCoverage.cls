public class ExportTestCoverage{
    public CoverageWrap cw {get;set;}
    public ExportTestCoverage(){
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getSalesforceBaseURL().toExternalForm()+'/services/data/v33.0/tooling/query/?q=Select+id,ApexClassorTrigger.Name,NumLinesCovered,NumLinesUncovered+from+ApexCodeCoverageAggregate');
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);
        if(res.getStatusCode() == 200){
            cw  = (CoverageWrap)JSON.deserialize(res.getBody(),CoverageWrap.class);
            system.debug('cw  '+cw  );
        }
    }
    
    public class Attributes {
        public String type;
        public String url;
    }

    public class Records {
        public Attributes attributes;
        public String Id;
        public ApexClassOrTrigger ApexClassOrTrigger {get;set;}
        public Integer NumLinesCovered {get;set;}
        public Integer NumLinesUncovered {get;set;}
    }

    public class ApexClassOrTrigger {
        public Attributes attributes;
        public String Name{get;set;}
    }
    
    public class CoverageWrap{
        public Integer size;
        public Integer totalSize;
        public Boolean done;
        public Object queryLocator;
        public String entityTypeName;
        public List<Records> records{get;set;}
    }
}