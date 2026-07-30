import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

def gateClosed (A : VlasovAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : VlasovAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse