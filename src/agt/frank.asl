!start.

+!start : .my_name(Me)
    <-  .print("started");
        .wait(2000);
        .send(erin, tell, started);
        +assigned(erin, complete(X), Me);
        .print("tell started to erin");
        .

// Adaptation Fact: detect
+detect(Me, What, How) : .my_name(Me)
    <-  .print("ADAPT FACT: detect Who: ", Me, " What: ", What, " How: ", How);
        //!detect(Me, What, How)
        .

// Adaptation Fact: design
+design(Me, What, How) : .my_name(Me)
    <-  .print("ADAPT FACT: Design Who: ", Me, " What: ", What, " How: ", How );
        .

// Adaptation Plans: detect
+!detect_goal(Me, What, How) : How & .my_name(Me)
    <-  .print("detected");
        +detected.

+!detect_goal(Me, What, How) : assigned(Ag, _, Me) & .my_name(Me)
    <-  .print("detect...");
        .send(Ag, askOne, How);
        .wait(2000);
        !detect(Me, What, How);
        .


+active(obligation(O))
    <-  .print("active O: ", O).

//achieve obligation
+active(obligation(Who,When,What,Deadline)) : .my_name(Who)
    <-  .print("active obligation: ", Who, When, What, Deadline);
        .print("achieve What: ", What, " When: ", When);
        !When; //todo: check
        .


// other NPL facts
+Instance[source(npli)]
    <-  .print("NPL FACT: ", Instance) .

// other SAI facts
+Constitutive[source(np)]
    <-  .print("SAI FACT: ", Constitutive) .

{ include("$jacamo/templates/common-cartago.asl") }
{ include("$jacamo/templates/common-moise.asl") }