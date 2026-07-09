trigger ForceForecasting on User (before update) {
for(User userlp : Trigger.new){
   userlp.CompanyName='Google-Inc';
   }
}