import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.VlasovPhaseSpace
import VlasovEquationsCanonicalLaneLean.VlasovPoissonSystem

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovNonLinearStabilityPackage (P : VlasovAdmittedObject) (VP : VlasovPoissonPackage P) where
  equilibriumDistribution : Type e
  perturbationClass : Type p
  linearizedOperator : Type l
  stabilityCondition : Prop
  nonlinearBootstrap : Prop
  asymptoticStability : Prop

structure VlasovNonLinearStabilityEvidence (P : VlasovAdmittedObject) (VP : VlasovPoissonPackage P)
    (NS : VlasovNonLinearStabilityPackage P VP) where
  stabilityConditionClosed : NS.stabilityCondition
  nonlinearBootstrapClosed : NS.nonlinearBootstrap
  asymptoticStabilityClosed : NS.asymptoticStability

def VlasovNonLinearStabilityClosed (P : VlasovAdmittedObject) (VP : VlasovPoissonPackage P)
    (NS : VlasovNonLinearStabilityPackage P VP) : Prop :=
  NS.stabilityCondition ∧ NS.nonlinearBootstrap ∧ NS.asymptoticStability

theorem vlasov_nonlinear_stability_closed_from_evidence (P : VlasovAdmittedObject) (VP : VlasovPoissonPackage P)
    (NS : VlasovNonLinearStabilityPackage P VP) (E : VlasovNonLinearStabilityEvidence P VP NS) :
    VlasovNonLinearStabilityClosed P VP NS := by
  exact And.intro E.stabilityConditionClosed
    (And.intro E.nonlinearBootstrapClosed E.asymptoticStabilityClosed)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse