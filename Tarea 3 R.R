install.packages("igraph")
library(igraph)
# Definir los personajes de Friends
personajes <- data.frame(name = c("Rachel", "Monica", "Phoebe", "Joey", "Chandler", "Ross"))
# Definir las relaciones entre los personajes y el tipo de relación
relaciones <- data.frame( from = c("Rachel", "Rachel", "Rachel", "Rachel", "Rachel",
                                   "Monica", "Monica", "Monica", "Monica", 
                                   "Phoebe", "Phoebe", "Phoebe", 
                                   "Joey", "Joey", 
                                   "Chandler"), 
                          to = c("Monica", "Phoebe", "Joey", "Chandler", "Ross",
                                 "Phoebe", "Joey", "Chandler", "Ross",
                                 "Joey", "Chandler", "Ross",
                                 "Chandler", "Ross",
                                 "Ross"),
                          relationship = c("friends", "friends", "friends", "friends", "partners",
                                           "friends", "friends", "partners", "friends",
                                           "friends", "friends", "friends",
                                           "friends", "friends",
                                           "friends"))
# Crear el grafo solo con las aristas
g <- graph_from_data_frame(d = relaciones, vertices = personajes, directed = FALSE)
# Asignar atributos de color a las aristas según el tipo de relación
E(g)$color <- ifelse(E(g)$relationship == "partners", "red", "purple")

# Asignar atributos de grosor a las aristas según el tipo de relación
E(g)$width <- ifelse(E(g)$relationship == "partners", 3, 1)

# Personalizar los vértices
V(g)$color <- "skyblue"
V(g)$size <- 25
V(g)$label.color <- "black"
V(g)$label.cex <- 1.5

# Visualizar el grafo
plot(g, layout = layout_with_fr, main = "Relaciones entre los personajes de Friends")
