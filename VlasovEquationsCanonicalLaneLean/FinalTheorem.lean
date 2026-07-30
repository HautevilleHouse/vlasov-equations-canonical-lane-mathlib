import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

def ConstrainedVlasovClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_vlasov_endgame (A : AdmissibleClass) :
    ConstrainedVlasovClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse