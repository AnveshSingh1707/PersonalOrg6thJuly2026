public class SharingRecordToUser{
    public static boolean manualShareToUser(Id recordId,Id userOrGroupId){
        //create the share object for job custom object
        Job__Share jobshare =new Job__Share();
        //assigning the record id to be shared to the share object
        jobshare.ParentId=recordId;
        //assigning the id to the useror group the record to be shared
        jobshare.UserOrGroupId=userOrGroupId;
        
        //set the access leve
        jobshare.AccessLevel='Read';
        //set the rowcause
        jobshare.RowCause=Schema.Job__Share.rowCause.manual;
        //now add these to the shareobject by saving it to the database
        Database.SaveResult sr =Database.insert(jobshare,false);//false will make partial processing if multiple reocrds are passed
        if(sr.isSuccess()){
            return true;
        }else{
            //get the first error
            Database.Error err =sr.getErrors()[0];
            
       
        if (err.getStatusCode()==StatusCode.FIELD_FILTER_VALIDATION_EXCEPTION && err.getMessage().contains('AccessLevel')){
            return true;
        }else{
            return false;
        }
            
        
    }
}
}