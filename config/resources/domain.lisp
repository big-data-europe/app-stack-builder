(in-package :mu-cl-resources)

(define-resource docker-compose ()
  :class (s-prefix "stackbuilder:DockerCompose")
  :properties `((:text :string ,(s-prefix "stackbuilder:text"))
                (:title :string ,(s-prefix "dct:title")))
  :resource-base (s-url "http://stack-builder.big-data-europe.eu/resources/docker-composes/")
  :on-path "docker-composes")


(define-resource container-item ()
  :class (s-prefix "stackbuilder:ContainerItem")
  :properties `((:title :string ,(s-prefix "dct:title"))
                (:repository :string ,(s-prefix "stackbuilder:repository"))
                (:docker-text :string ,(s-prefix "stackbuilder:dockerText")))
  :has-many `((container-relation :via ,(s-prefix "stackbuilder:relatedContainer")
                                :inverse t
                                :as "relations"))
  :resource-base (s-url "http://stack-builder.big-data-europe.eu/resources/container-items/")
  :on-path "container-items")

(define-resource container-group ()
  :class (s-prefix "stackbuilder:ContainerGroup")
  :properties `((:title :string ,(s-prefix "dct:title")))
  :has-many `((container-relation :via ,(s-prefix "stackbuilder:relatedGroup")
                                :inverse t
                                :as "relations"))
  :resource-base (s-url "http://stack-builder.big-data-europe.eu/resources/container-groups/")
  :on-path "container-groups")

(define-resource container-relation ()
  :class (s-prefix "stackbuilder:ContainerRelation")
  :properties `((:index :string ,(s-prefix "stackbuilder:index")))
  :has-one `((container-group :via ,(s-prefix "stackbuilder:relatedGroup")
                                :as "group")
              (container-item :via ,(s-prefix "stackbuilder:relatedContainer")
                                            :as "item"))
  :resource-base (s-url "http://stack-builder.big-data-europe.eu/resources/container-relations/")
  :on-path "container-relations")
