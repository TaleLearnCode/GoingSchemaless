CREATE TABLE dbo.WorldRegion
(
  WorldRegionCode CHAR(3)      NOT NULL,
  WorldRegionName VARCHAR(100) NOT NULL,
  ParentCode      CHAR(3)          NULL,
  IsActive        BIT          NOT NULL,
  CONSTRAINT pkcWorldRegion PRIMARY KEY CLUSTERED (WorldRegionCode),
  CONSTRAINT fkWorldRegion_WorldRegion FOREIGN KEY (ParentCode) REFERENCES dbo.WorldRegion (WorldRegionCode)
)
GO

CREATE NONCLUSTERED INDEX idxWorldRegion_ParentCode ON dbo.WorldRegion(ParentCode ASC);
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'WorldRegion',                                            @value=N'Represents a spoken/written language.',                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'WorldRegion', @level2name=N'WorldRegionCode',            @value=N'Identifier of the world region as defeined the UN M49 specification.',                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'WorldRegion', @level2name=N'WorldRegionName',            @value=N'Name of the world region as defeined the UN M49 specification.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'WorldRegion', @level2name=N'ParentCode',                 @value=N'Identifier of the world region parent (for subregions).',                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'WorldRegion', @level2name=N'IsActive',                   @value=N'Flag indicating whether the world region is active.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'WorldRegion', @level2name=N'pkcWorldRegion',             @value=N'Defines the primary key for the WorldRegion table using the WorldRegionCode column.',                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'WorldRegion', @level2name=N'fkWorldRegion_WorldRegion',  @value=N'Defines the relationship between the WorldRegion and WorldRegion tables for subregions using the ParentCode column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO