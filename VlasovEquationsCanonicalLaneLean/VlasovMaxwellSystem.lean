import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovMaxwellSystem where
  currentDensity : Type u
  ampheresLaw : Prop
  faradaysLaw : Prop
  gausssLawElectric : Prop
  gausssLawMagnetic : Prop
  chargeConservation : Prop

structure VlasovMaxwellSystemEvidence (V : VlasovMaxwellSystem) where
  currentDensityClosed : V.currentDensity
  ampheresLawClosed : V.ampheresLaw
  faradaysLawClosed : V.faradaysLaw
  gausssLawElectricClosed : V.gausssLawElectric
  gausssLawMagneticClosed : V.gausssLawMagnetic
  chargeConservationClosed : V.chargeConservation

def VlasovMaxwellSystemClosed (V : VlasovMaxwellSystem) : Prop :=
  V.currentDensity ∧ V.ampheresLaw ∧ V.faradaysLaw ∧ V.gausssLawElectric ∧ V.gausssLawMagnetic ∧ V.chargeConservation

theorem vlasov_maxwell_system_closed_from_evidence
    (V : VlasovMaxwellSystem) (E : VlasovMaxwellSystemEvidence V) :
    VlasovMaxwellSystemClosed V := by
  exact And.intro E.currentDensityClosed
    (And.intro E.ampheresLawClosed
      (And.intro E.faradaysLawClosed
        (And.intro E.gausssLawElectricClosed
          (And.intro E.gausssLawMagneticClosed E.chargeConservationClosed))))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse