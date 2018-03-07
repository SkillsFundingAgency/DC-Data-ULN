using System.Data.Entity;

namespace ESFA.DC.Data.ULN.Model.Interfaces
{
    public interface IULN
    {
        DbSet<UniqueLearnerNumber> UniqueLearnerNumbers { get; set; }
    }
}
