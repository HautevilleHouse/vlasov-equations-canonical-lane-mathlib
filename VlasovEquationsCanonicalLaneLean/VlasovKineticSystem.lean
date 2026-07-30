import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovKineticSystem where
  phaseSpace : Type u
  distributionFunction : Type v
  forceField : Type w
  collisionOperator : Type w -> Type x
  timeDomain : Type t
  positionSpaceSmooth : Prop
  forceFieldConservative : Prop
  collisionModelAdmissible : Prop
  initialDataSmooth : Prop

structure VlasovKineticEvidence (V : VlasovKineticSystem) where
  positionSpaceSmoothClosed : V.positionSpaceSmooth
  forceFieldConservativeClosed : V.forceFieldConservative
  collisionModelAdmissibleClosed : V.collisionModelAdmissible
  initialDataSmoothClosed : V.initialDataSmooth

def VlasovKineticClosed (V : VlasovKineticSystem) : Prop :=
  V.positionSpaceSmooth ∧ V.forceFieldConservative ∧ V.collisionModelAdmissible ∧ V.initialDataSmooth

theorem vlasov_kinetic_closed_from_evidence (V : VlasovKineticSystem) (E : VlasovKineticEvidence V) : VlasovKineticClosed V := by
  exact And.intro E.positionSpaceSmoothClosed
    (And.intro E.forceFieldConservativeClosed
      (And.intro E.collisionModelAdmissibleClosed E.initialDataSmoothClosed))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse