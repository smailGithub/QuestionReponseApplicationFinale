package applicationquestionreponse

import java.util.Date;

class Question {
	String type
	String question
	Date date
	static hasMany=[reponse:Reponse]
	String commentaire
	String etat
	Teacher enseignant
    
	static constraints = {
    
		}
}
