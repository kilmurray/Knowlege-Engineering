(clear)
(reset)

(deftemplate media
		(slot environment)
		(slot job)
		(slot feedback(default false))
		(slot stimulus_response)
		(slot stimulus_situation)
		(slot medium))
				
(assert(media(environment numbers)(job lecturing)(feedback true)))
				
(defrule rule-1
		(media(environment pages | manuals | documents | textbooks ))
		=>
		(modify 1(stimulus_situation verbal)))
		
(defrule rule-2
		(media(environment pictures | illustrations | photographs | diagrams))
		=>
		(modify 1(stimulus_situation visual)))
		
(defrule rule-3
		(media(environment machines | buildings |tools))
		=>
		(modify 1(stimulus_situation "physical objects")))
		
(defrule rule-4
		(media(environment  numbers | formulas | "computer programs"))
		=>
		(modify 1 (stimulus_situation symbolic)))	
		
(defrule rule-5
		(media(job lecturing | advising | counselling))
		=>
		(modify 1 (stimulus_response oral)))
		
(defrule rule-6
		(media(job building | repairing | troubleshooting))
		=>
		(modify 1(stimulus_respone "hands on")))
				
(defrule rule-7
		(media(job writing | typing | drawing))
		=>
		(modify 1(stimulus_respone documented)))
				
(defrule rule-8
		(media(job evaluating | reasoning | investigating))
		=>
		(modify 1(stimulus_respone analytical)))on
						
(defrule rule-10
		(media(stimulus_situation symbolic) (stimulus_response oral) (feedback true))
		=>
		(modify 1(medium lecture-tutorial)))
		
(defrule rule-11
		(media(stimulus_situation visual) (stimulus_response documented) (feedback true))
		=>
		(modify 1(medium video-cassette)))
		
(defrule rule-12
		(media(stimulus_situation visual) (stimulus_response oral) (feedback true))
		=>
		(modify 1(medium lecture-tutorial)))
		
(defrule rule-13
		(media(stimulus_situation verbal) (stimulus_response analytical) (feedback true))
		=>
		(modify 1(medium lecture-tutorial)))
		
(defrule rule-14
		(media(stimulus_situation verbal) (stimulus_response oral) (feedback true))
		=>
		(modify 1(medium role-play exercises)))
		
(defrule print
		?f1 <- (done)
		?f2 <- (media(medium ?m)(stimulus_response ?r)(stimulus_situation ?s)(environment ?e)(job ?j))
		=>
		(printout t ?m " " ?r " " ?s " " ?e " " ?j  crlf)
		)
		
		
(deffunction get-medium ()
	(run)
	(assert(done))
	(run)
)
(get-medium)