import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.VlasovPhaseSpace

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure LandauCollisionPackage (P : VlasovAdmittedObject) where
  collisionOperator : Type c
  fokkerPlanckTerm : Prop
  coulombLogarithm : Prop
  collisionConservesMass : Prop
  collisionConservesMomentum : Prop
  collisionConservesEnergy : Prop
  entropyProduction : Prop

structure LandauCollisionEvidence (P : VlasovAdmittedObject) (L : LandauCollisionPackage P) where
  fokkerPlanckTermClosed : L.fokkerPlanckTerm
  coulombLogarithmClosed : L.coulombLogarithm
  collisionConservesMassClosed : L.collisionConservesMass
  collisionConservesMomentumClosed : L.collisionConservesMomentum
  collisionConservesEnergyClosed : L.collisionConservesEnergy
  entropyProductionClosed : L.entropyProduction

def LandauCollisionClosed (P : VlasovAdmittedObject) (L : LandauCollisionPackage P) : Prop :=
  L.fokkerPlanckTerm ∧ L.coulombLogarithm ∧ L.collisionConservesMass ∧ L.collisionConservesMomentum ∧ L.collisionConservesEnergy ∧ L.entropyProduction

theorem landau_collision_closed_from_evidence (P : VlasovAdmittedObject) (L : LandauCollisionPackage P)
    (E : LandauCollisionEvidence P L) : LandauCollisionClosed P L := by
  exact And.intro E.fokkerPlanckTermClosed
    (And.intro E.coulombLogarithmClosed
      (And.intro E.collisionConservesMassClosed
        (And.intro E.collisionConservesMomentumClosed
          (And.intro E.collisionConservesEnergyClosed E.entropyProductionClosed))))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse