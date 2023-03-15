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
"well-off"
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




(list->string (letterDisplay (list #\e) "apple"))
