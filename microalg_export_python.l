(de Litteral (content)
  (cond
    ((num? content) content)
    ((str? content) (pack "\"" content "\""))
    (T "Littéral de type inconnu.")
  ))
(de Variable inputs
  (let (nom_var (car inputs))
    (if nom_var nom_var "")
  )
)
(de indent (!instr)
  (let (!lines_with_final_NIL (mapcar pack (split (chop !instr) "^J"))
        !lines (reverse (cdr (reverse !lines_with_final_NIL))))
       (mapcar (list '(!line)
                     (list 'pack "    " '!line "^J")) !lines)
  )
)

(de + @ (pack "(" (glue " + " (rest)) ")"))
(de - (A B) (pack "(" A "-" B ")"))
(de * @ (pack "(" (glue " * " (rest)) ")"))
(de / (A B) (pack "(" A "/" B ")"))
(de % (A B) (pack "(" A "%" B ")"))
(de ^ (A B) (pack "(" A "**" B ")"))

(de !!! (comz) (pack "# " (cdr (reverse (cdr (reverse (chop comz))))) "^J"))
(de Afficher (obj) (pack "print(" obj ")^J"))
(de Declarer !arg_lst
  (let (!splitted (split !arg_lst 'De_type)
        !vars (mapcar 'cadr (car !splitted))  # var name is in (Variable ...)
        !type (cadr (caadr !splitted)))  # type is in (Litteral ...)
        (pack "# " (glue ", " !vars) " sont des variables^J")
  )
)
(setq Déclarer 'Declarer)
(de Concatener @ (glue " + " (rest)))
(setq Concaténer 'Concatener)
(de Affecter_a !arg_lst
  (let (!var (cadr (car !arg_lst))  # var name is in (Variable ...)
        !val (eval (cadr !arg_lst)))
       (pack !var " = " !val "^J")))
(setq Affecter_à 'Affecter_a)
(de Entier@ (A B) (pack "random.randint(" A ", " B ")"))
(setq Vrai "True")
(setq Faux "False")
(de Si arg_lst (let (condition (car arg_lst)
                     kw_alors  (cadr arg_lst)
                     splitted  (split (cddr arg_lst) 'Sinon)
                     bloc_vrai (car splitted)
                     bloc_faux (cadr splitted))
                    (pack
                      "if " (eval condition) ":^J"
                      (mapcar 'eval bloc_vrai)
                      (if bloc_faux (pack "else:^J" (mapcar 'eval bloc_faux)))
                    )
                )
)
(de Non (bool) (pack "not (" bool ")"))
(de Et !arg_lst (pack "(" (glue " and " (mapcar 'eval !arg_lst)) ")"))
(de Ou !arg_lst (pack "(" (glue " or "  (mapcar 'eval !arg_lst)) ")"))
(de Tant_que arg_lst (let (!cond (car arg_lst)
                           !mot-clef (cadr arg_lst)
                           !corps (cddr arg_lst))
                          (pack
                            "while " (eval !cond) ":^J"
                            (mapcar 'eval !corps)
                          )
                     )
)
(de Faire arg_lst (let (!splitted (split arg_lst 'Tant_que)
                        !corps (car !splitted)
                        !cond (caadr !splitted))
                       (pack
                         "while True:^J"
                         (mapcar 'eval !corps)
                         "    if not (" (eval !cond) "):^J"
                         "        break^J"
                       )
                  )
)
(de Repeter arg_lst (let (nb (eval (car arg_lst))
                          prg (cddr arg_lst))
                         (pack "for _ in range(" nb "):^J"
                               (mapcar 'eval prg)
                         )
                    )
)
(setq Répéter 'Repeter)
(de =  (A B) (pack "(" A " == " B ")"))
(de <  (A B) (pack "(" A " < "  B ")"))
(de <= (A B) (pack "(" A " <= " B ")"))
(de >  (A B) (pack "(" A " > "  B ")"))
(de >= (A B) (pack "(" A " >= " B ")"))
(de =/ (A B) (pack "(" A " != " B ")"))

(de Liste @ (pack "[" (glue ", " (rest)) "]"))

(de 1000Cosinus (angle) (pack "math.cos(" angle "/180*math.pi)"))
(de 1000Sinus   (angle) (pack "math.sin(" angle "/180*math.pi)"))

(de Longueur (A) (pack "len(" A ")"))
(de Nieme (obj idx) (pack obj "[" idx "]"))
(de Millisecondes () "(time.time()*1000.0)")

(de Demander () "input()")
(de Demander_un_nombre () "float(input())")
(de Type (A) (pack "type(" A ")"))

(de Tete (obj) (pack obj "[0]"))
(de Queue (obj) (pack obj "[1:]"))
(de Ajouter_a (obj val) (pack obj ".append(" val ")^J"))
(de Retirer_de (obj val) (pack obj ".pop()^J"))
# En_position
(de Nieme@ (obj) (pack "random.choice(" obj ")"))
(de Texte (obj) (pack "str(" obj ")"))
(de Nombre (obj) (pack "float(" obj ")"))
(de ... () " (...) ")

(de !no_export (cmd)
  (pack "-- La commande " cmd " ne peut être exportée. --^J"))

(de Initialiser@ () (!no_export "Initialiser@"))
(de Definir () (!no_export "Definir"))
(de Définir () (!no_export "Définir"))
(de Retourner () (!no_export "Retourner"))
(de Exemples_de () (!no_export "Exemples_de"))
(de Tester () (!no_export "Tester"))
(de ? () (!no_export "?"))
# Rien
# Alors Sinon

(de AV () (!no_export "AV"))
(de BC () (!no_export "BC"))
(de LC () (!no_export "LC"))
(de TD () (!no_export "TD"))
(de TG () (!no_export "TG"))
(de Cercle () (!no_export "Cercle"))
(de Contour () (!no_export "Contour"))
(de Ellipse () (!no_export "Ellipse"))
(de Epaisseur () (!no_export "Epaisseur"))
(de RAZ () (!no_export "RAZ"))
(de Rectangle () (!no_export "Rectangle"))
(de Remplissage () (!no_export "Remplissage"))
(de Repere () (!no_export "Repere"))
(de Segment () (!no_export "Segment"))
(de Triangle () (!no_export "Triangle"))
