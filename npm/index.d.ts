declare module '@apiverve/agecalculator' {
  export interface agecalculatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface agecalculatorResponse {
    status: string;
    error: string | null;
    data: AgeCalculatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface AgeCalculatorData {
      dob:          Date | null;
      ageBreakdown: AgeBreakdown;
      ageWords:     AgeWords;
      timezone:     null | string;
      locale:       null | string;
      nextBirthday: AgeBreakdown;
      insights:     Insights;
  }
  
  interface AgeBreakdown {
      years?:  number | null;
      months:  number | null;
      weeks:   number | null;
      days:    number | null;
      hours:   number | null;
      minutes: number | null;
      seconds: number | null;
  }
  
  interface AgeWords {
      years:   null | string;
      ordinal: null | string;
      full:    null | string;
      locale:  null | string;
  }
  
  interface Insights {
      generation:      null | string;
      zodiacSign:      null | string;
      chineseZodiac:   null | string;
      birthstone:      null | string;
      dayOfWeekBorn:   null | string;
      isLeapYearBirth: boolean | null;
      milestones:      Milestones;
  }
  
  interface Milestones {
      canVoteUS:      boolean | null;
      canDrinkUS:     boolean | null;
      canRentCarUS:   boolean | null;
      seniorDiscount: boolean | null;
  }

  export default class agecalculatorWrapper {
    constructor(options: agecalculatorOptions);

    execute(callback: (error: any, data: agecalculatorResponse | null) => void): Promise<agecalculatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: agecalculatorResponse | null) => void): Promise<agecalculatorResponse>;
    execute(query?: Record<string, any>): Promise<agecalculatorResponse>;
  }
}
