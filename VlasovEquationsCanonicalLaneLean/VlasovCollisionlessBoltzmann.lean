import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure CollisionlessBoltzmannPackage where
  phaseSpace : Type u
  distributionFunction : Type v
  forceField : Type w
  vlasovEquation : Prop
  initialCondition : Prop
  boundaryCondition : Prop

structure CollisionlessBoltzmannEvidence (C : CollisionlessBoltzmannPackage) where
  vlasovEquationClosed : C.vlasovEquation
  initialConditionClosed : C.initialCondition
  boundaryConditionClosed : C.boundaryCondition

def CollisionlessBoltzmannClosed (C : CollisionlessBoltzmannPackage) : Prop :=
  C.vlasovEquation ∧ C.initialCondition ∧ C.boundaryCondition

theorem collisionless_boltzmann_closed_from_evidence (C : CollisionlessBoltzmannPackage)
    (E : CollisionlessBoltzmannEvidence C) : CollisionlessBoltzmannClosed C := by
  exact And.intro E.vlasovEquationClosed (And.intro E.initialConditionClosed E.boundaryConditionClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse