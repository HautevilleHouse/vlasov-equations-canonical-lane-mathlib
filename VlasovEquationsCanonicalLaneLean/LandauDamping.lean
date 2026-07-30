import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure LandauDampingPackage where
  linearizedOperator : Type u
  analyticContinuation : Prop
  dampingRate : Prop
  plasmaWaves : Prop
  stabilityCondition : Prop

structure LandauDampingEvidence (L : LandauDampingPackage) where
  linearizedOperatorClosed : L.linearizedOperator
  analyticContinuationClosed : L.analyticContinuation
  dampingRateClosed : L.dampingRate
  plasmaWavesClosed : L.plasmaWaves
  stabilityConditionClosed : L.stabilityCondition

def LandauDampingClosed (L : LandauDampingPackage) : Prop :=
  L.linearizedOperator ∧ L.analyticContinuation ∧ L.dampingRate ∧ L.plasmaWaves ∧ L.stabilityCondition

theorem landau_damping_closed_from_evidence
    (L : LandauDampingPackage) (E : LandauDampingEvidence L) :
    LandauDampingClosed L := by
  exact And.intro E.linearizedOperatorClosed
    (And.intro E.analyticContinuationClosed
      (And.intro E.dampingRateClosed
        (And.intro E.plasmaWavesClosed E.stabilityConditionClosed)))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse