import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovAdmittedObject where
  distribution : VlasovPDEDistribution
  coupling : ElectromagneticCouplingPackage
  closureWitness : Prop

structure VlasovAdmissibleClass where
  object : VlasovAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def VlasovWitnessClosed (O : VlasovAdmittedObject) : Prop :=
  O.closureWitness

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse