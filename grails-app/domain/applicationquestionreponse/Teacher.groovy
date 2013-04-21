package applicationquestionreponse

class Teacher extends User{
	
	static hasMany=[question:Question]
	
	static constraints = {
    
		}
}
