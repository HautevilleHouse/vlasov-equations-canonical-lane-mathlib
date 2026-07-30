import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovEntropyProduction where
  boltzmannHFunctional : Type u
  entropyProductionRate : Prop
  irreversibility : Prop
  equilibriumApproach : Prop
  freeEnergyDecay : Prop

structure VlasovEntropyProductionEvidence (V : VlasovEntropyProduction) where
  boltzmannHFunctionalClosed : V.boltzmannHFunctional
  entropyProductionRateClosed : V.entropyProductionRate
  irreversibilityClosed : V.irreversibility
  equilibriumApproachClosed : V.equilibriumApproach
  freeEnergyDecayClosed : V.freeEnergyDecay

def VlasovEntropyProductionClosed (V : VlasovEntropyProduction) : Prop :=
  V.boltzmannHFunctional ∧ V.entropyProductionRate ∧ V.irreversibility ∧ V.equilibriumApproach ∧ V.freeEnergyDecay

theorem vlasov_entropy_production_closed_from_evidence
    (V : VlasovEntropyProduction) (E : VlasovEntropyProductionEvidence V) :
    VlasovEntropyProductionClosed V := by
  exact And.intro E.boltzmannHFunctionalClosed
    (And.intro E.entropyProductionRateClosed
      (And.intro E.irreversibilityClosed
        (And.intro E.equilibriumApproachClosed E.freeEnergyDecayClosed)))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse