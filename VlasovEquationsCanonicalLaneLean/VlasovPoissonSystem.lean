import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovPoissonSystem where
  chargeDensity : Type u
  poissonEquation : Prop
  potentialRegularity : Prop
  forceField : Prop
  energyConservation : Prop

structure VlasovPoissonSystemEvidence (V : VlasovPoissonSystem) where
  chargeDensityClosed : V.chargeDensity
  poissonEquationClosed : V.poissonEquation
  potentialRegularityClosed : V.potentialRegularity
  forceFieldClosed : V.forceField
  energyConservationClosed : V.energyConservation

def VlasovPoissonSystemClosed (V : VlasovPoissonSystem) : Prop :=
  V.chargeDensity ∧ V.poissonEquation ∧ V.potentialRegularity ∧ V.forceField ∧ V.energyConservation

theorem vlasov_poisson_system_closed_from_evidence
    (V : VlasovPoissonSystem) (E : VlasovPoissonSystemEvidence V) :
    VlasovPoissonSystemClosed V := by
  exact And.intro E.chargeDensityClosed
    (And.intro E.poissonEquationClosed
      (And.intro E.potentialRegularityClosed
        (And.intro E.forceFieldClosed E.energyConservationClosed)))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse