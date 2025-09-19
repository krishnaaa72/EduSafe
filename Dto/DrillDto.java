package MASTER.DTO;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;


public class DrillDto {
    private int id;
    private String drillType;     // enum: emergency / mock
    private String drillDate;     // yyyy-MM-dd
    private String drillTime;     // HH:mm:ss
    private String disasterName;  // nullable
    private String notes;         // optional
    private String createdAt;     // timestamp

    public DrillDto() {}

    public DrillDto(int id, String drillType, String drillDate, String drillTime,
                    String disasterName, String notes, String createdAt) {
        this.id = id;
        this.drillType = drillType;
        this.drillDate = drillDate;
        this.drillTime = drillTime;
        this.disasterName = disasterName;
        this.notes = notes;
        this.createdAt = createdAt;
    }

    public DrillDto(String drillType, String drillDate, String drillTime,
                    String disasterName, String notes) {
        this.drillType = drillType;
        this.drillDate = drillDate;
        this.drillTime = drillTime;
        this.disasterName = disasterName;
        this.notes = notes;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getDrillType() { return drillType; }
    public void setDrillType(String drillType) { this.drillType = drillType; }

    public String getDrillDate() { return drillDate; }
    public void setDrillDate(String drillDate) { this.drillDate = drillDate; }

    public String getDrillTime() { return drillTime; }
    public void setDrillTime(String drillTime) { this.drillTime = drillTime; }

    public String getDisasterName() { return disasterName; }
    public void setDisasterName(String disasterName) { this.disasterName = disasterName; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}