import VlasovEquationsCanonicalLaneLean.VlasovMaxwellSystem

namespace HautevilleHouse
namespace VlasovEquationsCanonicalLaneLean

structure VlasovEnergyPackage {P : VlasovPhaseSpace} {F : VlasovPDEPackage P} {M : VlasovMaxwellPackage F} where
  kineticEnergy : Prop
  potentialEnergy : Prop
  totalEnergyConservation : Prop
  energyBounds : Prop

structure VlasovEnergyEvidence {P : VlasovPhaseSpace} {F : VlasovPDEPackage P} {M : VlasovMaxwellPackage F} (E : VlasovEnergyPackage M) where
  kineticEnergyClosed : E.kineticEnergy
  potentialEnergyClosed : E.potentialEnergy
  totalEnergyConservationClosed : E.totalEnergyConservation
  energyBoundsClosed : E.energyBounds

def VlasovEnergyClosed {P : VlasovPhaseSpace} {F : VlasovPDEPackage P} {M : VlasovMaxwellPackage F} (E : VlasovEnergyPackage M) : Prop :=
  E.kineticEnergy ∧ E.potentialEnergy ∧ E.totalEnergyConservation ∧ E.energyBounds

theorem vlasov_energy_closed_from_evidence {P : VlasovPhaseSpace} {F : VlasovPDEPackage P} {M : VlasovMaxwellPackage F} (E : VlasovEnergyPackage M) (Ev : VlasovEnergyEvidence E) : VlasovEnergyClosed E := by
  exact And.intro Ev.kineticEnergyClosed (And.intro Ev.potentialEnergyClosed (And.intro Ev.totalEnergyConservationClosed Ev.energyBoundsClosed))

end VlasovEquationsCanonicalLaneLean
end HautevilleHouse