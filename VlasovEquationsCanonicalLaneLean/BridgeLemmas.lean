import canonicalLaneMathlib.AdmissibleClass
import VlasovEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

def bridgeClosed (A : VlasovAdmissibleClass) : Prop :=
  VlasovWitnessClosed A.object

theorem bridge_from_admissible_class (A : VlasovAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.closureWitness

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse