package applicationquestionreponse
import applicationquestionreponse.Reponse;
class CalculResultTagLib {
	def calculQCM={attrs,body->
		def question=Teacher.findById(attrs.question)
		def reponse=Question.findByQuestion(question)
		def r1=Reponse.countByReponse("r1")
		def r2=Reponse.countByReponse("r2")
		def r3=Reponse.countByReponse("r3")
		def r4=Reponse.countByReponse("r4")
		
		out<<"Nombre d'etudiant ayant chosie la reponse 1 : ${r1}" 
		out<<"	Nombre d'etudiant ayant chosie la reponse 2 : ${r2}"
		out<<"	Nombre d'etudiant ayant chosie la reponse 3 : ${r3}"
		out<<"	Nombre d'etudiant ayant chosie la reponse 4 : ${r4}"
		}
	
	def calculTrueFalse={attrs,body->
			def question=Teacher.findById(attrs.question)
			def reponse=Question.findByQuestion(question)
			def vraie=Reponse.countByReponse("True")
			def faux=Reponse.countByReponse("False")
			
			out<<"Nombre d'etudiant ayant repondue vraie : ${vraie}"
			out<<"Nombre d'etudiant ayant repondue f : ${faux}"
			
		}
	
	def calculSimple={attrs,body->
		def question=Teacher.findById(attrs.question)
		def reponse=Question.findByQuestion(question)
		def rep=Reponse.findAllByReponse(reponse)
		out<<" -- ${rep} -- "
		
	}

}
