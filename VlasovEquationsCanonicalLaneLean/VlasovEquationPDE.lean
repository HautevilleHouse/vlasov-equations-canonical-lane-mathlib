import VlasovEquationsCanonicalLaneLean.VlasovPhaseSpace

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovPDEPackage (P : VlasovPhaseSpace) where
  distributionFunction : Type u
  timeParameter : Type v
  forceField : P.position → P.momentum
  collisionTerm : distributionFunction → distributionFunction
  transportEq : Prop
  forceEq : Prop
  collisionEq : Prop

structure VlasovPDEEvidence {P : VlasovPhaseSpace} (F : VlasovPDEPackage P) where
  transportEqClosed : F.transportEq
  forceEqClosed : F.forceEq
  collisionEqClosed : F.collisionEq

def VlasovPDEClosed {P : VlasovPhaseSpace} (F : VlasovPDEPackage P) : Prop :=
  F.transportEq ∧ F.forceEq ∧ F.collisionEq

theorem vlasov_pde_closed_from_evidence {P : VlasovPhaseSpace} (F : VlasovPDEPackage P) (E : VlasovPDEEvidence F) : VlasovPDEClosed F := by
  exact And.intro E.transportEqClosed (And.intro E.forceEqClosed E.collisionEqClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse