import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.VlasovPhaseSpace

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  (A.object : VlasovAdmittedObject).admissibleConclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact (A.object : VlasovAdmittedObject).admissibleConclusion

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedVlasovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_vlasov_endgame (A : AdmissibleClass) : ConstrainedVlasovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse