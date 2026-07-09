public with sharing class DeskMigratedCaseInteractions {

    public class Interaction implements Comparable {

        @AuraEnabled
        public CaseComment cc { get; private set; }
        @AuraEnabled
        public EmailMessage em { get; private set; }
        @AuraEnabled
        public Id id { get; private set; }
        @AuraEnabled
        public Datetime d { get; private set; }
        @AuraEnabled
        public String body { get; private set; }
        @AuraEnabled
        public String intType { get; set;}

        public Interaction(CaseComment cc, Id id, Datetime d, String body, String intType) {
            this.cc = cc;
            this.id = id;
            this.d = d;
            this.body = body;
            this.intType = intType;
        }

        public Interaction(EmailMessage em, ID id, Datetime d, String body, String intType) {
            this.em = em;
            this.id = id;
            this.d = d;
            this.body = body;
            this.intType = intType;
        }

        public Integer compareTo(Object compareTo) {
            Interaction compareToInteraction = (Interaction) compareTo;
            if (d == compareToInteraction.d) return 0;
            if (d < compareToInteraction.d) return 1;
            return -1;
        }
    }

    @AuraEnabled
    public static List<Interaction> getInteractions(Id recordId) {
        List<Interaction> interactionList;
        Boolean ccCheck = true;
        Boolean emCheck = true;
        Map<String, Schema.SObjectField> ccMap = Schema.SObjectType.CaseComment.fields.getMap();
        Map<String, Schema.SObjectField> emMap = Schema.SObjectType.EmailMessage.fields.getMap();

        String [] caseCommentFields = new String []{'Id', 'CommentBody', 'CreatedDate'};
        String [] emailMessageFields = new String []{'Id', 'Status', 'Subject', 'MessageDate', 'HtmlBody'};

        interactionList = new List<interaction>();

        for (String fieldToCheck : caseCommentFields) {
            if (!ccMap.get(fieldToCheck).getDescribe().isAccessible()) {
                ccCheck = false;
                break;
            }
        }

        for (String fieldToCheck : emailMessageFields) {
            if (!emMap.get(fieldToCheck).getDescribe().isAccessible()) {
                emCheck = false;
                break;
            }
        }

        if (ccCheck) {
            for (CaseComment cc : [
                    select Id, CommentBody, CreatedDate
                    from CaseComment
                    WHERE ParentId = :recordId]) {
                interactionList.add(new Interaction(cc, cc.Id, cc.CreatedDate, cc.CommentBody, 'comment'));
            }
        }

        if (emCheck) {
            for (EmailMessage em : [
                    select Id, Status, Subject, MessageDate, HtmlBody
                    from EmailMessage
                    WHERE ParentId = :recordId]) {
                interactionList.add(new Interaction(em, em.Id, em.MessageDate, em.HtmlBody, 'email'));
            }
        }

        if (interactionList.size() > 0) {
            interactionList.sort();
        }
        return interactionList;
    }
}