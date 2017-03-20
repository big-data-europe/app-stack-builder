(in-package :mu-cl-resources)

(define-resource docker-compose ()
  :class (s-prefix "stackbuilder:DockerCompose")
  :properties `((:text :string ,(s-prefix "stackbuilder:text"))
                (:title :string ,(s-prefix "dct:title")))
  :resource-base (s-url "http://stack-builder.big-data-europe.eu/resources/docker-composes/")
  :on-path "docker-composes")


(define-resource container ()
  :class (s-prefix "stackbuilder:Container")
  :properties `((:title :string ,(s-prefix "dct:title")))
  :has-many `((container-group :via ,(s-prefix "stackbuilder:containers")
                                :inverse t
                                :as "groups"))
  :resource-base (s-url "http://stack-builder.big-data-europe.eu/resources/containers/")
  :on-path "containers")

(define-resource container-group ()
  :class (s-prefix "stackbuilder:ContainerGroup")
  :properties `((:title :string ,(s-prefix "dct:title")))
  :has-many `((container :via ,(s-prefix "stackbuilder:containers")
                                :as "containers"))
  :resource-base (s-url "http://stack-builder.big-data-europe.eu/resources/container-groups/")
  :on-path "container-groups")
