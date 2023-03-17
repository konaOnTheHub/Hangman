#lang racket/gui

(define dictionary (list
"lean"
"anxious"
"upset"
"gratis"
"same"
"pale"
"foamy"
"decisive"
"juicy"
"laughable"
"political"
"shaggy"
"adamant"
"periodic"
"recondite"
"cultured"
"calm"
"civil"
"whimsical"
"capricious"
"lowly"
"psychological"
"unruly"
"wide-eyed"
"damaged"
"repulsive"
"hateful"
"severe"
"breakable"
"abstracted"
"tight"
"fallacious"
"vast"
"rural"
"statuesque"
"lamentable"
"healthy"
"unadvised"
"amazing"
"obedient"
"naughty"
"mature"
"ruddy"
"mean"
"parsimonious"
"awake"
"basic"
"female"
"moldy"))
(define word (list-ref dictionary (random (length dictionary))))
(define lettersGuessed (list))
(define attempts 0)


(define letterDisplay (λ (lettersGuessed word)
                        (for/list ([x (in-range 0 (string-length word) 1)])
                          (cond
                            ((list? (member (string-ref word x) lettersGuessed)) (string-ref word x))
                            (else #\-)))))

(define game (λ (guess word)
               (cond
                 ((string-contains? word guess) (set! lettersGuessed (cons (string-ref guess 0) lettersGuessed))
                                                (send letterMsg set-label (list->string (letterDisplay lettersGuessed word)))
                                                (cond
                                                  ((not (string-contains? (list->string (letterDisplay lettersGuessed word)) "-"))
                                                   (send wDialog show #t))))
                 ((false? (string-contains? word guess)) (set! attempts (+ 1 attempts))
                                                         (send scoreMsg set-label (number->string attempts))))))





(define frame (new frame%
                   [width 500]
                   [height 500]
                   [label "Hangman Game"]))

(define scoreMsg (new message%
                      [label (number->string attempts)]
                      [parent frame]))
(define letterMsg (new message%
                       [label (list->string (letterDisplay lettersGuessed word))]
                       [parent frame]))

(define inputField (new text-field%
                        [label "Place your guess"]
                      
                        [parent frame]))
(define submitButton (new button%
                          [label "Submit"]
                          [callback (lambda (x y)
                                    (game (send inputField get-value) word))]
                          [parent frame]))

(define wDialog (new dialog%
                     [label "Win"]
                     [parent frame]))

(define wDialogMsg (new message%
                        [label "You get to live another day :)"]
                        [parent wDialog]))



(send frame show #t)



