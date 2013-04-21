package applicationquestionreponse

class User {
	String nom
	String prenom
	String mail
	String pwd
	String role
	

    static constraints = {
		nom nullable:false , blank:false
		prenom nullable:false, blank:false
		pwd nullable:false, size:8..10
		role inList:["Enseignant","Etudiant"]
		mail email:true, blank:false
    }
}
