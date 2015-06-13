@isTest
global class TestExportTestCoverage implements HttpCalloutMock{
    
    static testMethod void testCallout(){
        Test.setMock(HttpCalloutMock.class, new TestExportTestCoverage());
        ExportTestCoverage etc = new ExportTestCoverage();
        System.assertNotEquals(etc.cw,null);
        System.assertNotEquals(etc.cw.records,null);
        System.assertEquals(etc.cw.records[0].NumLinesCovered,0);
        System.assertEquals(etc.cw.records[0].NumLinesUnCovered,10);
        System.assertEquals(etc.cw.records[0].ApexClassOrTrigger.Name,'MyCustomClass1');
    } 
    
    
    global HTTPResponse respond(HTTPRequest req) {
          // Create a fake response
          HttpResponse res = new HttpResponse();
          res.setHeader('Content-Type', 'application/json');
          res.setBody('{"size":141,"totalSize":141,"done":true,"queryLocator":null,"entityTypeName":"ApexCodeCoverageAggregate","records":[{"attributes":{"type":"ApexCodeCoverageAggregate","url":"/services/data/v33.0/tooling/sobjects/ApexCodeCoverageAggregate/715000000LxWDAA0"},"Id":"715000000LxWDAA0","ApexClassOrTrigger":{"attributes":{"type":"Name","url":"/services/data/v33.0/tooling/sobjects/ApexClass/01p000000C8J2AAK"},"Name":"MyCustomClass1"},"NumLinesCovered":0,"NumLinesUncovered":10},{"attributes":{"type":"ApexCodeCoverageAggregate","url":"/services/data/v33.0/tooling/sobjects/ApexCodeCoverageAggregate/715e0000000LxWEAA0"},"Id":"710000000LxWEAA0","ApexClassOrTrigger":{"attributes":{"type":"Name","url":"/services/data/v33.0/tooling/sobjects/ApexClass/01pe0000000C8JCAA0"},"Name":"MyCustomClass2"},"NumLinesCovered":7,"NumLinesUncovered":5}]}');
          res.setStatusCode(200);
          return res;
    }
}