public class SOSLExtension {
    
    private List<List<SObject>> queryResult;
    
    public SOSLExtension(ApexPages.StandardSetController sController) {
        queryResult = [FIND 'ed' IN Name FIELDS RETURNING Account(name), Contact(firstName, lastName, accountID ORDER BY lastName)];
        /*
         * SOSL Information:
         * FIND 'search query': This is what you're looking for. A field you search for has to start with this query
		 * IN {fields}: This is what fields you will be searching. This can be Name, Email, Phone or All for all 3. Default is All
		 * RETURNING: This is where you filter what you want to return. This is optional, but differs by object you want to return
		 * 
		 * There are more clauses to filter by, here are a few:
		 * WHERE: Works like in SOQL, only returns records where a condition is met
		 * LIMIT/OFFSET: Works like in SOQL, limits the records returned and offsets the start position
		 * ORDER BY: Works like in SOQL, reorders the records by a field
		 * USING: Filter records with a premade list view, like Recently Viewed or My Contacts
         */
    }
    
    public List<Account> getAccounts() {
        return queryResult[0];
    }
    
    public List<Contact> getContacts() {
        return queryResult[1];
    }
}