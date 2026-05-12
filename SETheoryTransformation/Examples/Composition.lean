import SETheoryTransformation.Operator.Composition

/-!
# Composition Examples

SETheoryTransformation.Examples.Composition

Initial example composition rules.
-/

namespace SETheoryTransformation

def splitThenMerge : CompositionRule :=
  {
    left := OperatorCode.SP
    right := OperatorCode.MG
    relation := CompositionRelation.inverseLike
  }

def bindThenUnbind : CompositionRule :=
  {
    left := OperatorCode.BD
    right := OperatorCode.UB
    relation := CompositionRelation.inverseLike
  }

def authorizeThenAttest : CompositionRule :=
  {
    left := OperatorCode.AZ
    right := OperatorCode.AT
    relation := CompositionRelation.composable
  }

end SETheoryTransformation
